# Plan: Fix Navigation & Prevent Redundant API Calls

## Problem

After changes to DI (cubits changed from `registerLazySingleton` to `registerFactory`) and navigation
(`AnimatedSwitcher` replaced with `UniqueKey` rebuild approach), all API requests started returning 404.

## Root Cause

The cubits were registered as `registerLazySingleton` in get_it. The navigation changes (UniqueKey approach)
destroyed and recreated `BlocProvider` on every tab switch, which **closed** the singleton cubit instance.
Since get_it returned the same closed instance, all subsequent API calls failed silently or errored.

## Fix Applied — Revert to Stable State

### 1. `main.dart` — Reverted to `IndexedStack`

`IndexedStack` keeps **all 5 screens alive** in the widget tree at all times. Only the visible screen is
rendered, but all others maintain their state. This means:

- `BlocProvider` is created once per screen and **never disposed**
- Cubits stay alive and are **never closed**
- API calls happen only once on first build
- No "Cannot emit after calling close" errors
- No redundant API requests

### 2. `di.dart` — Kept as `registerLazySingleton`

Since `IndexedStack` never disposes the cubits, `registerLazySingleton` is safe and correct:
- Cubit is created once, reused everywhere
- Never closed, so `isClosed` guards are just safety nets

### 3. `dio_factory.dart` — Reverted to original headers

Removed `ngrok-skip-browser-warning` header and `validateStatus` that were added during debugging.

## Current Navigation Behavior

- All 5 tabs build on app start (inside `IndexedStack`)
- Each screen's cubit fetches data once
- Switching tabs is instant — no API calls, no rebuilds
- Pull-to-refresh is still available for manual data refresh

## Files Changed

| File | Change |
|------|--------|
| `lib/main.dart` | `IndexedStack` instead of `_buildScreen` with `UniqueKey` |
| `lib/core/networking/dio_factory.dart` | Reverted to original headers |
| `lib/core/dependancy_injection/di.dart` | No changes needed (kept `registerLazySingleton`) |

## Trade-offs

- **All screens build eagerly** — all 5 children build on first render, including their API calls.
  For 5 screens this is negligible.
- **No tab switch animation** — `IndexedStack` doesn't animate. If desired, an `AnimatedOpacity`
  can be layered on top.
- **Data is fetched only once** — to get fresh data, user must pull-to-refresh manually.


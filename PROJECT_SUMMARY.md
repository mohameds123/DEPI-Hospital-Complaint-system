## Depi Hospital Complaint System — Project Summary

### Purpose
- Flutter app for hospital feedback: patients and staff submit complaints, requests, or suggestions; view status summaries; light chatbot UI.
- Targets multiple platforms (Android/iOS/web/desktop) using Flutter.

### Architecture
- Entry: `lib/main.dart` → `MaterialApp` seeded theme → `Onboarding1`.
- UI layers in `lib/Ui/`: screens per feature (onboarding, login/signup, home, complaint flows, chatbot) and shared widgets (buttons, text fields, radio, submit/attachment UI).
- State management: `flutter_bloc` cubits per feature (login, signup, home data, hospital list, new complaint) with simple state classes.
- Data models in `lib/Data/` mirror API payloads (complaint, hospital, login, signup, reports).
- API endpoints centralized in `lib/Core/api_paths.dart`.
- Networking via `dio`; minimal persistence via `shared_preferences` for role/ID.

### Key User Flows
1) **Onboarding & Role Choice**
   - `Onboarding1` shows hero image; `Onbaording2` lets user pick Patient, Staff, or Admin and routes to role-specific login.
2) **Authentication**
   - `LoginCubit.login` posts to `/login`; on 200 saves `role` in prefs and navigates to `Home`.
   - Patient login uses national ID + password; staff login uses work email + password.
   - Admin login screen is UI-only (no logic wired).
3) **Signup**
   - Patient/staff signup screens call `/register` with hardcoded role, then navigate to `Home` on success (`SignUpCubit`).
4) **Home Dashboard**
   - `HomeCubit.gethomedata` calls `/complaints/my`; UI shows counts (total, pending, in-progress, resolved) and details of the first pending issue; Floating Action Button opens new complaint flow; bottom nav uses `curved_navigation_bar`.
5) **New Complaint/Request/Suggestion**
   - `NewComplaintScreen` fetches hospitals (`/hospitals` via `GetHospitalListCubit`), pre-fills role/ID from prefs, collects department and hospital.
   - Patient path: choose type (Complaint/Request/Suggestion), enter title/description, optional anonymous toggle, submit via `NewComplaintCubit` to `/complaints`.
   - Staff path: choose type; Complaint/Suggestion or Request screens gather details (job title, priority for requests) and submit via `NewComplaintCubit`.
   - `SubmitButton` shows success dialog and routes back to `Home`.
6) **Chatbot**
   - Static UI in `chatbot.dart`; no backend integration yet.

### Data Models (high level)
- `ComplaintModel`: hospitalId, title, category, department, description, jobTitle, attachmentUrl.
- `HospitalModel`: id, name, location (+`fromList` helper).
- `ReportsResponse`: lists of pending/resolved `ReportItem` with computed counts and in-progress filter.
- `LoginModel`, `SignUpModel`: credential payloads.

### API Surface (from `ApiPaths`)
- Base: `https://h-c-m-system.azurewebsites.net`
- `/register`, `/login`, `/complaints` (submit), `/hospitals` (list), `/complaints/my` (user dashboard data).

### Dependencies
- Flutter SDK ^3.8.1; packages: `flutter_bloc`, `dio`, `shared_preferences`, `intl`, `curved_navigation_bar`, `cupertino_icons`; Poppins font and image assets configured in `pubspec.yaml`.

### Notable Gaps / Risks
- Admin login not implemented.
- Auth tokens/headers absent; only role saved locally. API calls largely unauthenticated.
- `NewComplaintCubit` posts the model object directly instead of `toJson()`; lacks headers/auth.
- Home assumes at least one pending item; empty responses could crash.
- Anonymous toggle does not change payload; request priority encoded in category string.
- Limited validation and error handling; no retry/timeout handling.
- Chatbot is UI-only.
- Tests only contain default `widget_test.dart`.

### Suggested Next Steps
- Implement proper auth/token storage and attach to all API calls; handle 401/500 gracefully.
- Guard Home UI against empty datasets; show placeholders.
- Wire Admin login; add logout flow and role-based routing.
- Use `ComplaintModel.toJson()` when posting; include headers and optional attachments.
- Add form validation, email/ID formats, and input masking; ensure anonymous flag affects payload.
- Replace placeholder chatbot with backend or remove until ready.
- Add analytics/logging and tests for cubits and UI flows; add CI lint/format/test steps.

### File Map (selected)
- `lib/main.dart` – app entry.
- `lib/Core/api_paths.dart` – API endpoints.
- `lib/Data/` – models.
- `lib/Logic/*` – cubits/states for login, signup, home, hospital list, new complaint.
- `lib/Ui/screens/` – onboarding, login/signup, home, complaint flows, chatbot.
- `lib/Ui/widgets/` – shared UI components (button, text field, radio, submit, attachment box).



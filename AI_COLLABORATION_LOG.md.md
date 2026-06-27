# AI Collaboration Log

## Purpose

This document describes how AI was used during the development of this take-home assignment.

AI was used as an engineering assistant and pair-programming partner to accelerate development, review architectural ideas, and discuss implementation strategies. The application was not generated in a single prompt. Development was performed incrementally with continuous manual review, debugging, compilation, and refactoring.

The final implementation, architecture, and engineering decisions remained under my control throughout the project.

---

# Development Workflow

Development followed a small iterative cycle instead of generating the entire project at once.

For every feature, the workflow was:

1. Decide the next feature or architecture improvement.
2. Ask AI for an implementation proposal.
3. Integrate the proposed code manually into the project.
4. Build the project in Xcode.
5. Fix compiler errors, runtime issues, or architectural problems.
6. Review whether the implementation actually matched the assignment requirements.
7. Refactor where necessary.
8. Repeat for the next feature.

This approach ensured every part of the project was understood and verified before moving forward.

---

# How AI Was Used

AI primarily helped with:

* Brainstorming architecture
* Discussing MVVM structure
* Designing the polymorphic Codable parser
* Exploring defensive decoding strategies
* Suggesting reusable SwiftUI components
* Reviewing validation approaches
* Generating initial implementations for individual files
* Reviewing parser resiliency
* Drafting unit tests
* Drafting documentation

Rather than acting as the source of truth, AI was used similarly to a senior engineering assistant that could rapidly propose implementations and alternative approaches.

---

# Manual Engineering Decisions & Refactors

Many generated implementations were intentionally modified after review.

## 1. Unknown Component Handling

Initial proposal:

Unknown text subtypes were decoded successfully and ignored during UI rendering.

Final implementation:

Unknown subtypes are rejected inside `DefaultFieldDecoder`, causing unsupported fields to be skipped during decoding.

Reason:

* Better separation of concerns
* UI never receives unsupported models
* Matches assignment requirements more closely

---

## 2. Defensive Parsing

Initial proposal:

Decoding failures inside a specific field model could propagate and fail the entire payload.

Final implementation:

Every concrete field model is decoded using defensive `try?` logic.

Malformed fields are skipped while valid fields continue decoding.

Reason:

The assignment specifically requested resilient polymorphic decoding.

---

## 3. FieldType Improvements

During implementation an `unknown` case was introduced for `FieldType`.

This required additional parser changes to ensure unsupported component types were safely ignored rather than causing decoding failures.

---

## 4. Swift 6 Concurrency

The original implementation produced Swift 6 actor isolation warnings due to repository initialization.

After compilation and review, the initialization flow was redesigned to eliminate concurrency warnings while preserving dependency injection.

---

## 5. Repository Design

The initial loading logic was inside the ViewModel.

This was refactored into a dedicated repository responsible only for loading and decoding the form.

Reason:

* Better separation of concerns
* Easier testing
* Future API integration

---

## 6. Input Components

Initially each text input duplicated border, padding, and error styling.

After implementation this was refactored into a reusable `InputContainer` component.

Reason:

* Reduced duplication
* Consistent styling
* Easier maintenance

---

## 7. Submission Payload

Initial implementation used:

```swift
[String: Any]
```

After review this was replaced with a strongly typed `SubmissionPayload` using `Encodable`.

Reason:

* Better type safety
* Cleaner API integration
* Easier testing

---

## 8. Validation

Validation behaviour was refined multiple times during development.

Changes included:

* Required field validation
* Character limit enforcement
* Live validation updates
* Reusable validation engine separated from UI

---

# Manual Fixes Performed During Development

Several AI-generated implementations required manual correction after integration.

Examples include:

* Fixing missing enum cases after introducing `FieldType.unknown`
* Correcting `Binding<String?>` to `Binding<String>`
* Resolving Swift 6 actor isolation warnings
* Fixing repository initialization
* Fixing asset color handling (`Color(hex:)` vs asset catalog colors)
* Updating parser flow after introducing unknown subtype handling
* Refactoring duplicate input styling into reusable components
* Correcting SwiftUI `ViewBuilder` limitations
* Resolving compiler errors introduced during incremental refactoring
* Updating decoding logic after architecture changes
* Ensuring all changes compiled successfully before proceeding

These changes were identified through compilation, testing, and manual code review rather than blindly accepting generated code.

---

# Validation Process

Each feature followed the same validation process:

* Implement feature
* Compile project
* Resolve compiler issues
* Run application
* Verify behaviour
* Refactor if required
* Continue to next feature

The project was intentionally developed one feature at a time rather than generating all files at once.

---

# Final Responsibility

AI suggestions were treated as implementation proposals.

Every generated snippet was manually:

* reviewed
* integrated
* compiled
* debugged
* modified when necessary
* tested

The final project architecture, implementation decisions, debugging process, and submitted code reflect my own engineering decisions, with AI serving as a productivity tool throughout development.

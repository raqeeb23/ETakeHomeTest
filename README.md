# Server-Driven UI Dynamic Form Engine

A dynamic form rendering engine built using **SwiftUI**, **MVVM**, and **Codable** that renders an entire form from a local JSON payload. The application follows a Server-Driven UI (SDUI) approach where the backend controls the form structure, ordering, validation rules, and theming without requiring application updates.

---

# Features

* Dynamic form rendering from JSON
* Polymorphic Codable parsing
* Defensive parsing of unknown or malformed components
* Ordered rendering using explicit `order`
* Global theming using hex color values
* Multiple text field subtypes

  * Plain
  * Multiline
  * Number
  * URL
  * Secure
* Dropdown (Single & Multi Select)
* Toggle
* Checkbox
* Required field validation
* Character counter & max length enforcement
* Strongly typed submission payload
* Offline-first architecture

---

# Architecture

The project follows a layered MVVM architecture.

```
SwiftUI Views
        │
        ▼
ViewModel
        │
        ▼
Repository
        │
        ▼
Parser
        │
        ▼
Models
```

The parser is intentionally separated from the UI layer so decoding decisions remain independent from rendering.

---

# Parsing Flow

```
JSON

        │

        ▼

FieldWrapper

        │

        ▼

DefaultFieldDecoder

        │

        ▼

Concrete Field Models

        │

        ▼

Field Enum

        │

        ▼

SwiftUI Rendering
```

Unknown component types and malformed field objects are skipped during decoding instead of causing the entire payload to fail.

---

# Product Decisions

### 1. Unknown Components

The assignment only specified that unknown component types should not crash the application.

Instead of creating placeholder UI or rendering empty views, unsupported and malformed fields are filtered during decoding itself.

This keeps the UI layer unaware of unsupported backend models and makes the parser more resilient.

---

### 2. Ordering

Fields are rendered using the explicit `order` property rather than relying on the array order received from the backend.

This makes rendering deterministic even if the backend changes the payload ordering.

---

### 3. Validation Timing

Validation is triggered when the user presses **Save**, while individual fields are revalidated as the user edits them.

This avoids showing errors immediately on first launch while still providing immediate feedback after user interaction.

---

# Defensive Parsing

The parser intentionally ignores:

* Unknown field types
* Unknown text subtypes
* Malformed field objects

This ensures that one invalid component never prevents valid components from rendering.

---

# Project Structure

```
EulerityTakeHomeTest

├── Models
├── Parsing
├── Repository
├── Resources
├── Validation
├── ViewModels
├── Views
├── Extensions
└── Tests
```

---

# Validation

The application currently supports:

* Required field validation
* Character limit validation
* Checkbox validation
* Dropdown validation

If validation succeeds, the submitted values are printed as a strongly typed JSON payload.

---

# Technologies Used

* Swift 6
* SwiftUI
* Codable
* MVVM
* Repository Pattern
* XCTest

---

# Running the Project

1. Open the project using Xcode 16 or later.
2. Ensure `form.json` is included in the application target.
3. Build and Run.
4. Press **Save** after filling the form to validate and print the resulting payload.

---

# Unit Tests

Unit tests cover:

* Successful JSON parsing
* Unknown component handling
* Unknown subtype handling
* Validation rules
* Defensive decoding

---

# What I Would Improve With More Time

If this project were extended beyond the scope of the assignment, I would focus on:

* Rich text support for checkbox metadata using `AttributedString`
* Dynamic keyboard focus management using `@FocusState`
* Regex-based validation for text fields
* Snapshot/UI tests
* Loading forms from a remote API with local caching
* Accessibility improvements (VoiceOver, Dynamic Type)

---

# Challenges & How I Worked Through Them

### Defensive Polymorphic Decoding

One challenge was ensuring that unsupported or malformed components would not fail decoding of the complete payload.

Instead of allowing decoding failures to propagate, the parser was redesigned to safely skip invalid components while continuing to decode valid ones.

---

### Building a Reusable Dynamic UI

The form contains multiple field types with different validation rules while sharing common styling.

To reduce duplication, common styling was extracted into reusable components and validation logic was separated from the UI.

---

### Swift 6 Concurrency

While integrating the repository into the ViewModel, Swift 6 actor isolation warnings appeared.

The initialization flow was adjusted to remove concurrency warnings while keeping the architecture testable and maintaining dependency injection.

---

# AI Collaboration

AI was used as an engineering assistant throughout development.

Rather than generating the project in a single prompt, development was performed incrementally through multiple implementation, debugging, review, and refactoring cycles.

A detailed collaboration record is included in **AI_COLLABORATION_LOG.md**.

---

# Future Improvements

* Rich text hyperlinks
* Async form loading
* Remote caching
* Better accessibility
* Snapshot testing
* Theme switching

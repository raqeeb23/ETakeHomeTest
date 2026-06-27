# Server-Driven UI Dynamic Form Engine

A dynamic form rendering engine built with **SwiftUI** using a **Server-Driven UI (SDUI)** architecture. The application parses a JSON payload and dynamically renders form components without requiring app updates for form changes.

---

## Features

- Dynamic form rendering
- Defensive polymorphic Codable parsing
- Server-driven architecture
- Unknown field types are skipped safely
- Unknown text subtypes are skipped safely
- Theme support using hex colors
- Required field validation
- Character limit validation
- Single & Multi-select dropdowns
- Toggle support
- Checkbox support
- Strongly typed submission payload
- MVVM Architecture

---

## Architecture

```
Presentation
│
├── SwiftUI Views
├── Components
│
ViewModel
│
Repository
│
Parser
│
Models
```

### Parsing Flow

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
Concrete Models
   │
   ▼
Field Enum
```

Unknown or malformed fields are skipped during decoding to prevent the entire payload from failing.

---

## Folder Structure

```
Sources

├── Models
├── Parsing
├── Repository
├── ViewModels
├── Views
├── Validation
├── Resources
```

---

## Validation

Supported validations:

- Required fields
- Maximum character limit
- Checkbox validation
- Dropdown validation

---

## Defensive Parsing

The decoder intentionally ignores:

- Unknown component types
- Unknown text subtypes
- Malformed field objects

This ensures one invalid component never breaks the complete form.

---

## Technologies

- Swift 6
- SwiftUI
- Codable
- MVVM
- Repository Pattern

---

## Running the Project

1. Open the project in Xcode 16+
2. Ensure `form.json` is included in the application target.
3. Build & Run.

---

## Tests

Current unit tests include:

- JSON decoding
- Unknown field skipping
- Unknown subtype skipping
- Validation rules

---

## Future Improvements

- Async network form loading
- Remote caching
- AttributedString hyperlinks
- Accessibility improvements
- Snapshot testing

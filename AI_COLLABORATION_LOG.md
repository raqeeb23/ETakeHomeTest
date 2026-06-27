# AI Collaboration Log

## Purpose

This document describes how AI was used throughout the development of this take-home assignment.

AI was used as an engineering assistant and pair-programming partner to accelerate development, review architecture, discuss implementation strategies, and help debug issues encountered during development.

The final implementation, architectural decisions, debugging, and integration remained my responsibility. Every generated snippet was reviewed, compiled, modified where necessary, and tested before becoming part of the project.

---

# Collaboration Workflow

Development followed an iterative workflow rather than generating the entire application at once.

Typical workflow for each feature:

1. Decide the next feature or architectural improvement.
2. Ask AI for implementation ideas or possible approaches.
3. Integrate the proposed implementation manually.
4. Build the project in Xcode.
5. Identify compiler errors, runtime issues, or architectural concerns.
6. Discuss improvements with AI.
7. Refactor the implementation.
8. Verify behaviour.
9. Continue to the next feature.

This cycle was repeated throughout the project.

---

# Areas Where AI Assisted

AI was used for:

* Brainstorming architecture
* Designing the polymorphic Codable parser
* Discussing defensive decoding strategies
* Reviewing MVVM separation
* Suggesting reusable SwiftUI components
* Validation architecture
* Repository design
* Unit test ideas
* Documentation
* General code review

AI was treated as an engineering assistant rather than the source of truth.

---

# Representative Collaboration

## Example 1 — Parser Design

**Prompt**

> Design a resilient polymorphic Codable architecture that skips unknown field types instead of failing the entire payload.

**Initial AI Proposal**

A polymorphic parser using a wrapper object and a Field enum.

**Final Decision**

Accepted as the base architecture.

Later modified to:

* skip malformed fields
* skip unknown text subtypes during decoding
* separate parser responsibilities from rendering

Reason:

The initial proposal still allowed unsupported subtypes into the UI layer.

---

## Example 2 — Unknown Text Subtypes

Initial implementation:

Unknown text subtypes were decoded successfully and ignored by rendering an EmptyView.

After manual review this behaviour was rejected.

Final implementation:

Unknown subtypes are filtered inside `DefaultFieldDecoder` and never reach the UI layer.

Reason:

This better satisfies the assignment requirement that unsupported components should be ignored gracefully.

---

## Example 3 — Defensive Parsing

Initial implementation:

Concrete field models threw decoding errors.

After testing, this was changed to defensive decoding using optional decoding (`try?`) so malformed fields are skipped while valid fields continue decoding.

Reason:

One invalid backend object should not prevent the rest of the form from loading.

---

## Example 4 — Input Components

Initially each text component duplicated border styling and layout.

After implementation this was refactored into a reusable `InputContainer`.

Reason:

Reduce duplication and improve maintainability.

---

## Example 5 — Submission Payload

Initial implementation used:

```swift
[String: Any]
```

After discussion this was replaced with a strongly typed `SubmissionPayload` using `Encodable`.

Reason:

Improved type safety and easier testing.

---

# Manual Debugging Performed

During implementation several issues required manual debugging and changes after integrating AI-generated code.

Examples include:

* Missing `FieldType` enum cases after introducing `.unknown`
* Updating parser flow after unknown subtype handling
* Fixing `Binding<String?>` vs `Binding<String>`
* Swift 6 actor isolation warnings
* Repository initialization changes
* Correcting `ViewBuilder` limitations
* Refactoring duplicated input styling
* Hex color parsing issues
* Validation improvements
* Compiler errors introduced during incremental refactoring

Each issue was compiled, reproduced, and resolved before continuing.

---

# Manual Engineering Decisions

Several implementation decisions differ from the initial AI suggestions.

Examples include:

* Moving unsupported subtype handling from the UI layer to the parser.
* Making the parser resilient to malformed field objects.
* Introducing reusable input containers.
* Replacing `[String: Any]` with a strongly typed submission model.
* Refining validation behaviour after testing the UX.

These changes were made after reviewing the generated code and considering maintainability, resilience, and assignment requirements.

---

# Validation Process

Every feature followed the same review cycle.

* Implement
* Compile
* Fix compiler issues
* Run application
* Verify behaviour
* Refactor where necessary
* Repeat

This ensured that every architectural decision was validated before moving to the next feature.

---

# AI Conversation Record

Development involved multiple iterative conversations covering:

* project planning
* parser architecture
* SwiftUI implementation
* validation engine
* repository refactoring
* parser improvements
* Swift 6 compatibility
* reusable components
* unit testing
* documentation

The examples above represent the nature of those conversations and the engineering decisions made throughout development.

---

# Final Responsibility

AI suggestions were treated as implementation proposals.

Every generated snippet was manually:

* reviewed
* integrated
* compiled
* debugged
* modified where necessary
* tested

The submitted project reflects my own engineering decisions and understanding, with AI serving as a productivity tool and collaborative development assistant throughout the implementation process.

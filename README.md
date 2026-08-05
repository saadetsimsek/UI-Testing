# UI Testing

*An XCUITest suite driving a login flow end to end.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-17.5%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Topic](https://img.shields.io/badge/topic-XCUITest-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

A two screen application used as a target for UI tests. The tests launch the app, find real elements by their labels, type into them, tap through and assert what appears, with a screenshot attached to the report.

## How it works

```mermaid
sequenceDiagram
    participant T as XCTestCase
    participant A as XCUIApplication
    participant V as ViewController
    participant AC as AccountViewController

    T->>A: launch()
    T->>A: staticTexts["Log in"]
    T->>T: assert it exists
    T->>A: textFields["Username"].tap() and typeText
    T->>A: secureTextFields["Password"].tap() and typeText
    T->>A: buttons tap
    A->>V: action handled
    V->>AC: navigation occurs
    T->>A: assert the account screen elements
    T->>T: XCTAttachment(screenshot: app.screenshot())
```

## Implementation notes

- **Elements queried by type and label.** Using `staticTexts`, `textFields` and `secureTextFields` keeps the query specific, so a matching label elsewhere does not resolve first.
- **Secure fields are their own query.** A password field does not appear under `textFields`, which is a common source of failing tests.
- **Screenshots attached to the report.** `XCTAttachment` makes a failure diagnosable from CI output alone.
- **Launch per test.** Each test launches a fresh application instance, so no test depends on the state another one left behind.

## Project structure

```
Testing/
├── ViewController.swift          login screen
├── AccountViewController.swift   destination screen
└── TestingUITests/              the suite
```

## Requirements

Xcode 15 or later, iOS 17.5 or later. Run with the test action rather than the run action.

import Testing

@testable import Noora

struct SingleChoicePromptTests {
    enum Option: String, CaseIterable, CustomStringConvertible, Equatable {
        case option1
        case option2
        case option3

        var description: String {
            rawValue
        }
    }

    let renderer = MockRenderer()
    let terminal = MockTerminal()
    let keyStrokeListener = MockKeyStrokeListener()

    @Test func renders_the_right_content() throws {
        // Given
        let subject = SingleChoicePrompt(
            title: "Integration",
            question: "How would you like to integrate Tuist?",
            description: "Decide how the integration should be with your project",
            theme: Theme.test(),
            terminal: terminal,
            collapseOnSelection: true,
            renderer: renderer,
            standardPipelines: StandardPipelines(),
            keyStrokeListener: keyStrokeListener
        )
        keyStrokeListener.keyPressStub = [.downArrowKey, .upArrowKey]

        // When
        let _: Option = subject.run()

        // Then
        var renders = Array(renderer.renders.reversed())
        #expect(renders.popLast() == """
        Integration
          How would you like to integrate Tuist?
          Decide how the integration should be with your project
            ❯ option1
              option2
              option3
          ↑/↓/k/j up/down • enter confirm
        """)
        #expect(renders.popLast() == """
        Integration
          How would you like to integrate Tuist?
          Decide how the integration should be with your project
              option1
            ❯ option2
              option3
          ↑/↓/k/j up/down • enter confirm
        """)
        #expect(renders.popLast() == """
        Integration
          How would you like to integrate Tuist?
          Decide how the integration should be with your project
            ❯ option1
              option2
              option3
          ↑/↓/k/j up/down • enter confirm
        """)
        #expect(renders.popLast() == """
        ✔︎ Integration: option1 
        """)
    }

    @Test func renders_the_right_content_when_no_title() throws {
        // Given
        let subject = SingleChoicePrompt(
            title: nil,
            question: "How would you like to integrate Tuist?",
            description: "Decide how the integration should be with your project",
            theme: Theme.test(),
            terminal: terminal,
            collapseOnSelection: true,
            renderer: renderer,
            standardPipelines: StandardPipelines(),
            keyStrokeListener: keyStrokeListener
        )
        keyStrokeListener.keyPressStub = [.downArrowKey, .upArrowKey]

        // When
        let _: Option = subject.run()

        // Then
        var renders = Array(renderer.renders.reversed())
        #expect(renders.popLast() == """
        How would you like to integrate Tuist?
        Decide how the integration should be with your project
          ❯ option1
            option2
            option3
        ↑/↓/k/j up/down • enter confirm
        """)
        #expect(renders.popLast() == """
        How would you like to integrate Tuist?
        Decide how the integration should be with your project
            option1
          ❯ option2
            option3
        ↑/↓/k/j up/down • enter confirm
        """)
        #expect(renders.popLast() == """
        How would you like to integrate Tuist?
        Decide how the integration should be with your project
          ❯ option1
            option2
            option3
        ↑/↓/k/j up/down • enter confirm
        """)
        #expect(renders.popLast() == """
        ✔︎ How would you like to integrate Tuist?: option1 
        """)
    }
}

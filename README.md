# interview_project

## Development approach.

In building project, I opted for several design principles and tools to ensure the application is robust, maintainable, and scalable. The key components I used are Clean Architecture, the Dartz package, Equatable, and GetIt. Here’s why I chose each of them:

### Clean Architecture

Why Clean Architecture?

Clean Architecture provides a comprehensive framework for creating systems that are easy to maintain and test. By implementing Clean Architecture, I can separate the code into different layers, each with its specific responsibility. This separation ensures that changes in one layer (like the user interface) do not affect other layers (like business logic or data access). It also facilitates unit testing and makes the application more flexible and adaptable to changes.

#### Layers:

- Use Cases: Use Cases encapsulate application-specific business rules and define the actions that can be performed with the entities.
- Repositories (Abstract and Implementation): The abstract repositories define the contracts for data access while the implementations handle the actual data fetching and storage, often utilizing various data sources such as local storage or remote APIs.
- Data Sources: These are responsible for actual data operations, like fetching data from an API or caching it locally.
- Presentation: This layer includes UI components and state management, making it easy to display data to the user and handle user interactions.

### Dartz Package

Why Dartz?

The Dartz library brings functional programming paradigms to Dart, which helps in writing more predictable, maintainable, and testable code. By leveraging functional concepts like `Either` and `Option`, error handling becomes more robust, and the code is more expressive regarding success and failure scenarios.

#### Benefits:

- Type Safety: Ensures data types are respected throughout the codebase.
- Immutability: Encourages using immutable data structures, which can prevent many common bugs caused by mutable state.
- Functional Composition: Makes the handling of data transformations and business logic more straightforward and concise.

### Equatable

Why Equatable?

Equatable simplifies the implementation of equality comparisons in Dart objects, making it easier to compare objects without having to write boilerplate code for `==` and `hashCode`. This is particularly useful in state management, where comparing states efficiently is crucial for performance and correctness.

#### Benefits:

- Reduced Boilerplate: Automatically generates`==` and `hashCode` methods for object comparison.
- Simplified State Management: Makes it easier to implement state equality checks, a common requirement in state management solutions like BLoC.

### GetIt

Why GetIt?

GetIt is a lightweight and straightforward service locator for dependency injection in Flutter. It helps manage dependencies in a centralized manner, making the code cleaner and more organized. By using GetIt, I can easily register and retrieve dependencies anywhere in the application, promoting loose coupling and easier unit testing.

#### Benefits:

- Centralized Dependency Management: Simplifies the process of injecting dependencies, making the codebase more organized.
- Promotes Decoupling: Helps in developing more modular code by reducing dependencies between different parts of the application.
- Ease of Use: Registering and retrieving objects is straightforward, which enhances developer productivity.

## Limitations

My limitations would be the time constraints for the submission. Custom UI is quite verbose (evident in the code length), So a robust time frame would allow proper tidying up of a lot of code.

## Instructions for running the application.

Due to the limitation of the package `youtube_player_flutter` I can't run the app effectively on the web. Also, you'd need the latest version of Xcode to run the app on iOS due to this package constraints. Works fine on android though.

## Conclusion

By integrating Clean Architecture, Dartz, Equatable, and GetIt into my Flutter project, I aim to create an application that is not only functional but also clean, maintainable, and scalable. Each component plays a crucial role in achieving these goals:

- Clean Architecture ensures a structured approach to development.
- Dartz enhances the code with functional programming constructs.
- Equatable simplifies state management and equality checks.
  GetIt offers a robust solution for dependency injection.

Together, these tools provide a solid foundation for developing high-quality Flutter applications.

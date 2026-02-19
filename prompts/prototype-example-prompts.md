# General Prototype Prompt

Example of a simple prototype prompt to create or prototype a project in something like v0 or Bolt:

### Template

```text
I want to build [SPECIFIC FEATURE/COMPONENT]

FEATURES:
- [Feature 1]
- [Feature 2]
- [Feature 3]

TECHNICAL REQUIREMENTS:
- [Framework/Library versions]
- [Styling approach]
- [State management if relevant]

CONSTRAINTS:
- [Any limitations or requirements]
- [Performance considerations]
- [Browser support needs]

CONTEXT:
[Any relevant existing code or architecture]

[OPTIONAL: Start with X, then we'll add Y]
```

### Example 1 (Todo App)

```text
Build a todo app in React with the following requirements:

FEATURES:

- Add, edit, delete, and mark todos complete
- Filter by: All, Active, Completed
- LocalStorage persistence
- Drag and drop to reorder

TECHNICAL:

- React with functional components and hooks
- Tailwind CSS for styling
- Responsive design

UI:

- Clean, minimal interface similar to Todoist
- Use checkboxes for completion
- Inline editing for task names"
```

### Example 2 (API Integration)

```text
Integrate the OpenWeatherMap API into my React app:

REQUIREMENTS:

- Create a WeatherService.js file for API calls
- Fetch current weather and 5-day forecast
- Include proper error handling for failed requests
- Add loading states
- Display temperature, conditions, and weather icon

API DETAILS:

- Use OpenWeatherMap API (I have a key)
- Endpoints needed: current weather and forecast
- Handle both successful and error responses

Show me the service file first, then we'll integrate it into components.
```

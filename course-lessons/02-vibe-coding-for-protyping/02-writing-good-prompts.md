# Writing Effective Prompts for AI Code Generation

Before we start building anything, let's talk about prompts. The quality of what you get from AI tools is directly tied to the quality of your prompts. I see a lot of developers struggle with AI not because the AI is bad, but because they're not giving it enough information to work with.

You'll notice in this course, I give very detailed prompts, in fact, I would say most of the important prompts for features are actually documents that we pass to the AI. That way, we stay in control and ask for very specific things.

## Bad Prompts vs Good Prompts

Let me show you some examples:

### Example 1: Todo App

**Bad Prompt:**
"Build me a todo app in React"

**Why it's bad:**

- Too vague - what features do you want?
- No technical requirements specified
- No UI/UX direction
- The AI has to guess everything

**Good Prompt:**
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
- Inline editing for task names

**Why it's good:**

- Specific features listed
- Technical stack defined
- UI expectations set
- Gives design reference point

### Example 2: API Integration

**Bad Prompt:**
Add weather API to my app

**Why it's bad:**

- Which weather API?
- What data should it show?
- Where in the app does it go?
- No error handling mentioned

**Good Prompt:**
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

**Why it's good:**

- Specifies which API
- Lists exact data needed
- Mentions error handling and loading states
- Asks for modular code (service file)
- Breaks it into steps

## Key Principles for Good Prompts

**1. Be Specific About Features**
Don't say "user authentication" - say "email/password login with JWT tokens, password reset flow, and protected routes"

**2. Define Your Tech Stack**
Don't let AI guess. Specify: React or Vue? Tailwind or styled-components? REST or GraphQL?

**3. Set Quality Expectations**

- Mention error handling
- Request loading states
- Ask for responsive design
- Specify accessibility needs

**4. Provide Context**
If this component fits into existing code, explain that. "This will integrate with my existing Express API that returns user data in this format: {...}"

**5. Break Down Complex Tasks**
Instead of "build a complete dashboard," start with "create the layout structure with sidebar and main content area, then we'll add components one by one"

**6. Give Visual References**
"Make it look like Stripe's dashboard" or "use a card-based layout like Trello" gives AI clear direction

**7. Ask for Explanation When Learning**
Add: "Explain your approach and any important implementation details" when you want to understand, not just copy-paste

## Example Template

In large projects, I generally create my context documents before I do any prompts. This has a ton of information about what I want how I want it built. Then I'll tell the AI to read those documents, but if you're prompting directly with not context files, this is a good template to use:

```
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

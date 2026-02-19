# CRUD End-to-End Tests (Playwright)

## Overview

Playwright end-to-end tests that verify full CRUD functionality through the browser. Tests should navigate the app, interact with forms, and assert correct UI updates.

## Login

- Navigate to the login page
- Sign in with email: demo@devstash.io and password: 12345678
- Verify successful login and redirect to `/dashboard`
- All subsequent tests should run as this authenticated user

## Requirements

### Create

- Click the "New Item" button in the top bar to open the create dialog
- Fill in all required fields with test data
- Submit the form
- Verify the dialog closes
- Verify the new item appears in the items list

### Read

- Navigate to an items list page (e.g., `/items/snippets`)
- Verify items render in the grid layout
- Verify each item card displays the correct title and content
- Click on an item to open the detail drawer
- Verify the drawer shows all item fields (title, content, tags, dates)

### Update

- Open an item's detail drawer
- Click the Edit button to enter edit mode
- Verify the form fields are pre-filled with current values
- Modify one or more fields
- Click Save
- Verify the updated data is reflected in the drawer and list

### Delete

- Open an item's detail drawer
- Click the delete (trash) button
- Confirm the deletion in the confirmation dialog
- Verify the drawer closes
- Verify the item is removed from the list

## General Test Guidelines

- Tests should be independent and not rely on order
- Clean up test data after each test or use unique identifiers

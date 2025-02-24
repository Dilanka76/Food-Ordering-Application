# Food Ordering Application

## Overview
This project is a **Food Ordering Application** developed as part of an assignment. The application allows users to browse menus, select meal times, add items to a basket, and proceed with ordering.

## Features
- **Home Page**
  - Displays the breakfast menu by default.
  - Includes a **draggable sheet** with three selectable meal times:
    - **Breakfast 6 AM - 12 PM**
    - **Lunch 12 PM - 6 PM**
    - **Dinner 6 PM - 12 AM**
    - The home page updates based on the selected meal time.
    - Includes a toggle button with options: **Picked**, **Delivery**, and **Table**. Switching between these options updates the item prices based on the relevant dataset
  
**Navigation & Categories**
  - Users can tap a menu item to navigate to the **Category Page**.
  - The category list updates based on the first menu selection.
  - Items can be added to the basket using an "Add to Basket" icon button.
  - When the "Add to Basket" icon is pressed once, it changes to an "OK" status to indicate the item has been added.
  - Pressing the icon again changes it back to the "Add to Basket" icon, allowing users to remove the item from the basket.
  - Added items appear in the bottom section with:
    - Selected category count
    - Total price

- **View Basket**
  - A "View Basket List" option in the bottom section opens a popup showing the selected items.
  - Users can navigate to the menu item list by:
    - Tapping a category item in the basket list
    - Selecting an item from the main category list

- **Menu Item Page**
  - Displays details of selected items.
  - If an item is a Deal, a "Item is a Deal" tag appears in the top-left corner of the main image.
  - Includes a **tab bar** with item details (the tab bar is located under the main menu item image).
  - Additional functionalities:
    - If an item has **modifiers**, selectable options appear below the tab bar.
    - The modifier section changes based on a given JSON list
    - If the modifier's **IsMinPermittedOptional** field is checked, the count section can increment or decrement.
    - A **quantity selector** is available at the left bottom.
    - In the right bottom, an "Add to Cart" section shows a popup named Proceed Order. The popup displays the added items list, and users    can either Confirm Order or Cancel Order.
    - A cart icon is visible in the top right corner on every page, allowing users to view their cart at any time. Clicking it opens the cart, where users can proceed with their order.

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/Dilanka76/Food-Ordering-Application.git
   ```
2. Navigate to the project folder:
   ```sh
   cd food_ordering_application
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application in the desired mode:
   - For Android:
     ```sh
     flutter run -d android
     ```
   - For iOS:
     ```sh
     flutter run -d ios
     ```

## Technologies Used
- **Flutter**
- **Dart**
- **Application Mode**
- **State Management**: Provider
- **Local Storage**: JSON File

## Dart Packages Used (from pub.dev)
- **cupertino_icons: ^1.0.8**
- **flutter_add_to_cart_button: ^1.2.0**
- **provider: ^6.1.2**
- **toggle_switch: ^2.3.0**

---

# Nuxify WidgetBook

The **Nuxify WidgetBook** is a modular, reusable library of Flutter widgets designed to streamline development and maintain consistency across projects. 

The library is divided into core components and optional extensions, ensuring the core module stays lightweight and free of unnecessary dependencies. This makes it easier to integrate into various projects without introducing unwanted third-party libraries.

Widgets that rely on third-party dependencies, such as the **QR Reader**, are separated into individual modules. 

To include these widgets in your project, you can import them as needed. 

For example, to use the QR Reader widget, add the following to your `pubspec.yaml`:

```
nuxify_widgetbook_qr_scanner:
  git:
    url: https://github.com/Nuxify/widgetbook.git
    path: qr_scanner
    ref: v1.6.0
```

### View the WidgetBook Online

You can explore and interact with all available widgets through our web interface at **[widgetbook.nuxify.tech](https://widgetbook.nuxify.tech/)**.

## Buttons

-   **Action Button:**  
    Use `FilledButton()` for primary actions requiring emphasis.
    
-   **Outlined Action Button:**  
    Use `OutlinedButton()` for secondary actions that require less emphasis.
    
-   **Icon Button:**  
    Use `IconButton.filled()` for buttons that consist of icons, ideal for minimalist UIs or toolbar actions.
    

## Indicators

-   **Horizontal Step Indicator:**  
    Use `HorizontalStepper()` to visually represent a multi-step process.
    
-   **Chip Indicator:**  
    Use `ChipIndicator()` to show small, customizable status indicators.
    
-   **Chip Selection:**  
    Use `ChipsSelection()` for a quick, user-friendly method of selecting options.
    
-   **Empty View Placeholder:**  
    Use `EmptyViewPlaceholder()` to show an empty state with an icon and text, centered in the view.
    
-   **Avatar (with fallback initials):**  
    Use `CircleAvatar()` to display a profile image or fallback initials if no image is available.
    

## Textfields & Inputs

-   **Filled TextField:**  
    Use `FilledTextField()` for text input fields that require a filled background.
    
-   **Outlined TextField:**  
    Use `OutlinedTextField()` for text input fields with a border outline.
    
-   **Dropdown Menu:**  
    Use `DropdownMenu()` to present users with a dropdown selection.
    
-   **Pincode TextField:**  
    Use `PincodeView()` for secure pin code input.
    
-   **QR Reader:**  
    Use `QRScanner()` to integrate QR code scanning functionality in your app.
    *Note: This widget is **not** included in the core module. To use it, you must import the `nuxify_widgetbook_qr_scanner` module separately.*
    

## Views

-   **Alert Modal:**  
    Use `AppAlertDialog()` for simple pop-up alerts with customizable content.
    
-   **BottomSheet:**  
    Use `AppBottomSheet()` to show a draggable bottom panel, triggered via `openBottomSheet()`.
    
-   **Expanded BottomSheet:**  
    Similar to `AppBottomSheet()`, but extends the height for more content.
    
-   **List Item:**  
    Use `ListTile()` for a variety of list items:
    
    -   Single-line item
    -   Two-line item
    -   Three-line item

## Layout

-   **Dashboard Scaffold:**  
    Use `DashboardScaffold()` for a dashboard layout, perfect for admin panels or content-rich pages.

## Navigation

-   **App Bottom Navigation:**  
    Use `AppBottomNavigation()` for customizable bottom navigation in your app, ideal for quick access to key sections.


Creating a Content Management System (CMS) that includes modules for CRUD (Create, Read, Update, Delete) operations on Product Types, Product Categories, Products, Users, Roles, and an Audit Trail. Below is an outline of how you might structure and design this CMS:

**1. Database Schema:**

 -   Define the database tables for each module:

 -   **Product Types:**
    -   name:string
    -   description:text - optional
    -   active:boolean
	    -    Validate that the name is unique.
		-   Ensure that the name is not empty.
 -   **Product Categories:**
    -   name:string
    -   description:text - optional
    -   product_type_id (Foreign Key to Product Types)
    -   active:boolean
	     -   Validate that the name is unique within a product type.
		 -   Ensure that the name is not empty.
 -   **Products:**
    -   name:string
    -   description:text
    -   price:decimal
    -   product_type_id (Foreign Key to Product Types)
		    - *once a product type is selected, only product categories associated with that product type can be selected*
    -   product_category_id (Foreign Key to Product Categories)
    -  active:boolean
	    -   Create, update, and delete individual product listings.
		-   Validate that the product name is not empty and that it is unique within a product category.
		-   Ensure that the price is a non-negative decimal value.
 -   **Product Skus:** (Add by adding nested form in products module)
	-  product_id (Foreign Key to Products)
	-  code:string
	-  color:string
		-  Validate that the code is unique.
		- Validate that the color is unique within a product.
		- Atleast 1 SKU is required per product.
 -   **Roles**
    -   name:string
    -   active:boolean
	    -  Validate that the code is unique.
 -   **Users:** (Use gem ***devise***)
    -   first_name:string
    -   last_name:string
    -   email:string
    -   contact_number:string
    -   role_id (Foreign Key to Roles)

 -   **Audit Trail:**
    -   user_id (Foreign Key to Users)
    -   module_action:string (e.g., CREATE, UPDATE, DELETE)
    -   module_name:string (e.g., Products, Categories, Types, Users)
    -   module_data:text
    -   timestamps


**Additional Notes**

 - Ensure that audit records are automatically generated for each CRUD operation.
 - We have 3 roles only:

|id| role name  |
|--|--|
| 1 | Super Admin |
| 2 | Admin |
| 3 | Manager |

***Role Acces:***

 - **Super Admin**
	 - FULL ACCESS - All Modules
 - **Admin**
	 - FULL ACCESS - Product Types, Product Categories, Products
				 - Hide other modules on the sidebar menu
				 - Implement role-based access control to restrict user access to certain module/functionalities
-	**Manager**
	-	FULL ACCESS - Products
	-	VIEW ONLY - Product Types, Product Categories
				- Hide other modules on the sidebar menu
				- Implement role-based access control to restrict user access to certain module/functionalities

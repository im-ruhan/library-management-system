# Library Management System API

## Introduction

This is a Ruby on Rails application for a Library Management System. The system is designed to manage a collection of books across multiple libraries, allowing operations such as creating libraries, adding books, registering borrowers, lending and returning books, checking fines, and paying fines.

## Getting Started

### Prerequisites

- Ruby (version X.X.X)
- Ruby on Rails (version X.X.X)
- ...

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/library-management-system.git
    ```

2. Change into the project directory:

    ```bash
    cd library-management-system
    ```

3. Install dependencies:

    ```bash
    bundle install
    ```

4. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

### Usage

1. Start the Rails server:

    ```bash
    rails server
    ```

2. API Endpoints:

    - Create Library: `POST /libraries`
    - Add Book to Library: `POST /libraries/:library_id/books`
    - Find Books by Title: `GET /books/find_by_title`
    - Register Borrower: `POST /libraries/:library_id/borrowers`
    - Lend Books: `POST /libraries/:library_id/borrowers/:borrower_id/lend_books`
    - Return Books: `POST /libraries/:library_id/borrowers/:borrower_id/return_books`
    - Get Fine: `GET /libraries/:library_id/borrowers/:borrower_id/get_fine`
    - Pay Fine: `POST /libraries/:library_id/borrowers/:borrower_id/pay_fine`


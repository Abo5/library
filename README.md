# Library 

## Overview

Welcome to the Library Project, a web application designed to provide users with access to a diverse collection of books. This application allows users to explore various books, view detailed information about each book, and download or read them online. The project is built using Ruby on Rails and leverages an external API to fetch the latest book data.

## Features

- **Browse Books**: View a collection of the latest 15 books, including details such as title, author, section, download count, and more.
- **Search by Sections**: Explore books categorized into different sections to find specific genres or topics of interest.
- **Book Details**: Access detailed information about each book, including its title, author, section, download links, and book cover.
- **About Us**: Learn more about the mission and story behind the Library Project.
- **Contact Us**: Get in touch with the team for any questions or feedback.

## Project Structure

### Controllers

- **HomeController**: Manages the home, index, books, sections, about, and contact pages. It includes a `before_action` to load data before rendering the index, books, and sections pages.

### Models

- The project primarily interacts with data fetched from an external API, so there are no traditional Rails models in use.

### Views

- **home.html.erb**: The landing page of the application.
- **index.html.erb**: Displays the latest 15 books.
- **books.html.erb**: Similar to the index, lists all available books.
- **sections.html.erb**: Lists books categorized into different sections.
- **about.html.erb**: Provides information about the project and its mission.
- **contact.html.erb**: A form for users to contact the project team.

### External API Integration

The project fetches book data from an external API using the `HTTParty` gem. The data includes details about the latest books and different sections. The `load_data` method in the `HomeController` handles this API call and processes the response.

## How to Run the Project

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/Abo5/library.git
    cd library
    ```

2. **Install Dependencies**:
    ```sh
    bundle install
    ```

3. **Setup Database**:
    The project uses an external API for data, so no local database setup is required.

4. **Run the Server**:
    ```sh
    rails server
    ```

5. **Visit the Application**:
    Open your web browser and go to `http://localhost:3000`.

## Contributing

We welcome contributions from the community. If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
    ```sh
    git checkout -b feature-name
    ```
3. Commit your changes.
    ```sh
    git commit -m "Description of your changes"
    ```
4. Push to the branch.
    ```sh
    git push origin feature-name
    ```
5. Create a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/Abo5/library/blob/main/License) file for details.

## Contact

For any questions or feedback, please contact us at info@library.com.

---

Thank you for using the Library Project! We hope you enjoy exploring our collection of books.

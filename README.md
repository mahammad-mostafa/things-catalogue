<a name="title"></a>

<!-- TITLE -->

# 🏷️ Things Catalogue

This is the capstone project of the fourth module in the **Microverse** program.
<br/>
Check the below contents for further details about this project.

<!-- CONTENTS -->

# 📗 Contents

- [Description](#description)
- [Instructions](#instructions)
- [Authors](#authors)
- [Future](#future)
- [Contributions](#contributions)
- [Support](#support)
- [Acknowledgements](#acknowledgements)
- [License](#license)

<!-- DESCRIPTION -->

<a name="description"></a>

# 📖 Description

This repository is about a catalogue of different item types that the user can add or display.
There is one parent class `Item` and three children classes (`Book` / `MusicAlbum` / `Game`).
Three classes (`Label` / `Genre` / `Author`) have one to many association with `Item` class.
Built unit tests for implemented methods of seven classes (`Item` / `Book` / `MusicAlbum` / `Game` / `Label` / `Genre` / `Author`).
Created database tables for items data inside `schema.sql` file. 

📌 **Tech Stack:**
- Application uses `Ruby`
- Unit tests run with `RSpec`
- Linting is done with `Rubocop`
- Schema file uses `PostgreSQL`

📌 **Key Features:**
- User is given the option to either add new item or display a list
- Available item types to add (`book` / `music album` / `game`)
- Available list types to display (`books` / `albums` / `games` / `labels` / `genres` / `authors`)
- Adding any new item will require the use to select (`label` / `genre` / `author`) form a list or create new ones
- All items created by the user are stored in `json` files and reloaded after restart


<p align="right"><a href="#title">back to top</a></p>

<!-- INSTRUCTIONS -->

<a name="instructions"></a>

# 🛠️ Instructions

You can easily download or fork this repository and work on it immadiately!

📌 **Prerequisites:**
- You need `Ruby` language & `PostgreSQL` database installed

📌 **Installation:**
- To install all gem dependencies run
```
bundle install
```

📌 **Development:**
- Run `main.rb` file with
```
ruby main.rb
```

📌 **Tests:**
- To run unit tests navigate to `specs` directory and run:
```
rspec . -f d
```

<p align="right"><a href="#title">back to top</a></p>

<!-- AUTHORS -->

<a name="authors"></a>

# 👥 Authors

📌 **Mahammad:**
- [GitHub](https://github.com/mahammad-mostafa)
- [Twitter](https://twitter.com/mahammad_mostfa)
- [LinkedIn](https://linkedin.com/in/mahammad-mostafa)

📌 **Carlos:**
- [GitHub](https://github.com/CarlosZ96)

📌 **Austin:**
- [GitHub](https://github.com/stino-x)

<p align="right"><a href="#title">back to top</a></p>

<!-- FUTURE -->

<a name="future"></a>

# 🔭 Future

Some additional features I may implement in the project:
- [ ] Use `Rails` framework with this project
- [ ] Implement better visual interface

<p align="right"><a href="#title">back to top</a></p>

<!-- CONTRIBUTIONS -->

<a name="contributions"></a>

# 🤝🏻 Contributions

Wish to contribute to this project?
<br/>
Contributions, issues, and feature requests are more than welcome!
<br/>
Feel free to check the [issues](../../issues) page too.

<p align="right"><a href="#title">back to top</a></p>

<!-- SUPPORT -->

<a name="support"></a>

# ⭐️ Support

Like this project? Show your support by starring!

<p align="right"><a href="#title">back to top</a></p>

<!-- ACKNOWLEDGEMENTS -->

<a name="acknowledgements"></a>

# 🙏🏻 Acknowledgements

I thank everyone at **Microverse** for guiding me through this project.

<p align="right"><a href="#title">back to top</a></p>

<!-- LICENSE -->

<a name="license"></a>

# 📝 License

This project is [MIT](LICENSE.md) licensed.

<p align="right"><a href="#title">back to top</a></p>
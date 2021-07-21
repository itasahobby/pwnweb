[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">

  <h3 align="center">Pwnweb</h3>

  <p align="center">
    Simple 
    <br />
    <br />
    <a href="https://github.com/itasahobby/pwnweb/issues">Report Bug</a>
    ·
    <a href="https://github.com/itasahobby/pwnweb/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The tool provides a simple Web server using http server including reverse shells with the given IP and port.



<!-- GETTING STARTED -->
## Getting Started

To install it run the following commands:

```sh
sudo apt install libpcap0.8-dev libcap-dev golang
go get -u github.com/liamg/furious
sudo wget https://raw.githubusercontent.com/itasahobby/pwnweb/master/pwnwebscan.sh -O /usr/bin/pwnweb
sudo chmod +x /usr/bin/pwnweb
```


<!-- USAGE EXAMPLES -->
## Usage

```
pwnweb.sh [OPTION]...
main options are described below.
Options:
-h,--help Display this help and exit
-l,--lhost Target IP
-i,--interface Target network interface
-d,--directory Directory to run pwnweb on
```



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/itasahobby/pwnweb/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- CONTACT -->
## Contact

Your Name - [@jusepe_it](https://twitter.com/jusepe_it) - itasahobby@gmail.com

Project Link: [https://github.com/itasahobby/pwnweb](https://github.com/itasahobby/pwnweb)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [ippsec](https://twitter.com/ippsec?lang=es)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/itasahobby/pwnweb.svg?style=for-the-badge
[contributors-url]: https://github.com/itasahobby/pwnweb/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/itasahobby/pwnweb.svg?style=for-the-badge
[forks-url]: https://github.com/itasahobby/pwnweb/network/members
[stars-shield]: https://img.shields.io/github/stars/itasahobby/pwnweb.svg?style=for-the-badge
[stars-url]: https://github.com/itasahobby/pwnweb/stargazers
[issues-shield]: https://img.shields.io/github/issues/itasahobby/pwnweb.svg?style=for-the-badge
[issues-url]: https://github.com/itasahobby/pwnweb/issues
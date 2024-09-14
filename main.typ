#import "lib.typ": resume, icon, experience, project, language, volunteering

#show: resume.with(
  author: "Gregor Grigorjan",
  contacts: (
    [#icon("icons/solid/envelope.svg") #link("mailto:gregor@grigorjan.net")],
    [#icon("icons/solid/globe.svg") #link("https://www.grigorjan.net/")[grigorjan.net]],
    [#icon("icons/brands/github.svg") #link("https://github.com/gekoke")[gekoke]],
    [#icon("icons/brands/linkedin.svg") #link("https://www.linkedin.com/in/gregor-grigorjan/")[gregor-grigorjan]],
  ),
)

= Summary
Software enthusiast and open-source contributor with nearly 7 years of experience, a knack for Linux systems, and an interest in cybersecurity.
Most proficient in mainstream object-oriented languages, but a polyglot with a penchant for functional paradigms at heart.

= Work Experience
#experience(
  "Orkla Accounting Centre",
  "Data Analyst",
  "Tallinn, Estonia",
  "Jun 2021 - Oct 2022",
  [
    - Maintained software deployments processing thousands of invoices per month
    - Developed mission-critical .NET application to parse thousands of sales data entries
    - Eliminated administrative processes saving hours of time per month using Python and Selenium
  ],
)

= Entrepreneurial Experience
#experience(
  [#link("https://www.abiõpetaja.ee")[Abiõpetaja]],
  "Technical Co-Founder",
  "Tallinn, Estonia",
  "Jan 2024 - present",
  [
    - Developed Django application and guaranteed its reliability with end-to-end NixOS tests
    - Ensured reproducible provisioning of infrastructure using Terraform (OpenTofu)
    - Bootstrapped a reliable CI/CD pipeline to AWS using Nix, NixOS, and GitHub Actions
  ],
)

= Education
#experience(
  "TalTech",
  "BSc - Computer Science",
  "Tallinn, Estonia",
  "Sep 2020 - Jun 2024",
  [
    - Tutored coursemates in Python, Java, C++, Haskell, Idris, and Ansible courses
  ],
)

= Personal Projects
#project(
  [#link("https://github.com/gekoke/magit-file-icons")[magit-file-icons]],
  [
    An Emacs Lisp package which prefixes filenames in the #link("https://github.com/magit/magit")[Magit Git client] with #link("https://www.nerdfonts.com/")[Nerd Font] icons
  ],
)

#project(
  [#link("https://github.com/gekoke/dotfiles")[dotfiles]],
  [
    Declarative and reproducible system configurations with Nix
  ],
)

#project(
  [#link("https://github.com/gekoke/xsdm")[xsdm]],
  [
    An extra simple terminal display manager written in Go (_work in progress_)
  ],
)

#project(
  [#link("https://github.com/gekoke/flake-auto-follows")[flake-auto-follows]],
  [
    A CLI tool to check for unfollowed #link("https://wiki.nixos.org/wiki/Flakes")[Nix Flake] inputs written in Rust (_work in progress_)
  ],
)

= Cybersecurity Competitions
- Finalist at CyberSpike 2023
- Ranked \#4 in Estonia on #link("https://ctftime.org/team/223398")[CTFTime]

= Volunteering
#volunteering(
  [#link("https://nixos.org/")[NixOS]],
  "Contributor",
  "Oct 2022 - present",
  [
    - Packaging and updating software for the world's largest package archive #link("https://github.com/NixOS/nixpkgs")[nixpkgs]
  ],
)

#volunteering(
  [#link("https://www.gnu.org/")[GNU Project]],
  "Community Member",
  "May 2023 - present",
  [
    - Maintaining a #link("https://melpa.org/")[MELPA] package
  ],
)

= Languages
#language("Estonian", "Native")

#language("English", "C2")

# new

<p align="center">
    <img src="https://i.ibb.co/rxN9C5h/logo.png"/>
</p>

Project initialization scripts

## Usage

To create a new project use the following command:

```sh
new python foo 'My new project **foo**'
```

Here, we are giving 3 arguments to the command `new` - project type, project name and description. The last argument value will be inserted into readme.

Similarly, to remove an existing project run the following statement:

```sh
wen python foo
```

## Installation

For quick installation use `setup.sh` script which can be run directly with curl:

```sh
curl -Ls https://cutt.ly/setup-new | bash
```

For manual installation clone the repo to the home folder:

```sh
git clone https://github.com/zeionara/new.git $HOME/new
```

After that, add the following line to your `.bashrc`:

```sh
. $HOME/new/main.sh
```

And then restart the terminal.

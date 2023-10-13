from click import group, argument


@group()
def main():
    pass


@main.command()
@argument('path', type = str)
def run(path: str):
    print(path)


if __name__ == '__main__':
    main()

#!/usr/bin/env python3

import click


@click.group(context_settings=dict(help_option_names=["-h", "--help"]))
@click.option('-n', '--name', prompt='Your first name',
              help='The person to greet.')
@click.option('-s', '--surname', help='Your surname')
def hello(name, surname):
    if surname is not None:
        click.echo(click.style(f"Hello {name} {surname}", fg='red'))
    else:
        click.echo(click.style(f"Hello {name}", fg='green'))

@hello.command()
def sub():
    click.secho("Hello continent", fg='blue')

if __name__ == '__main__':
    hello()

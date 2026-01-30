#!/usr/bin/env python

import argparse
import os.path

import jinja2
import pandas


if '__main__' == __name__:
    parser = argparse.ArgumentParser(
        prog='Likert', description='Generate visualizations of Likert data')

    parser.add_argument('path')

    parser.add_argument('groups')
    parser.add_argument('scale')

    args = parser.parse_args()

    groups = args.groups.split(',')
    print('Groups: {}'.format(groups))

    scale = args.scale.split(',')
    print('Likert scale: {}'.format(scale))

    environment = jinja2.Environment(
        loader=jinja2.FileSystemLoader(os.path.join(os.path.dirname(__file__),
                                                    './templates')),
    )

    data = pandas.read_csv(args.path)
    for i, field in enumerate(data.columns, start=1):
        print('[{:2d}] {}'.format(i, field))

    categorical = int(input('Enter the categorical field: ')) - 1
    categorical = data.columns[categorical]
    # drop data that is outside the specified group(s)
    data = data[data[categorical].isin(groups)]

    question = int(input('Enter the question field: ')) - 1
    question = data.columns[question]
    # drop data that is outside the specified group(s) and question(s)
    data = data[[categorical, question]]

    print({
        'groups': groups,
        'offsets': {},
        'responses': data.groupby(categorical).value_counts().unstack(fill_value=0).reindex(scale, axis='columns', fill_value=0).to_dict(),
        'respondents': data.groupby(categorical)[question].count().to_dict(),
        'scale': scale,
    })
    template = environment.get_template('likert.tex')
    content = template.render({
        'groups': groups,
        'offsets': {},
        'responses': data.groupby(categorical).value_counts().unstack(fill_value=0).reindex(scale, axis='columns', fill_value=0).to_dict(),
        'respondents': data.groupby(categorical)[question].count().to_dict(),
        'scale': scale,
    })
    print(content)

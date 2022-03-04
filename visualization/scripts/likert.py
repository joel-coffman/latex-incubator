#!/usr/bin/env python

import sys

import jinja2


scales = {
    5: [
        'Strongly disagree',
        'Disagree',
        'Neutral',
        'Agree',
        'Strongly agree',
    ],
}


environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader('templates'),
)

for arg in sys.argv[1:]:
    values = arg.split(',')
    values = [int(value) for value in values]

    scale = scales[len(values)]

    responses = dict(zip(scale, values))

    offset = sum([value for value in values[:len(values) // 2]])
    if len(values) % 2 == 1:
        offset = offset + values[(len(values) - 1) // 2] / 2.0

    context = {
        'offset': offset / sum(values),
        'responses': responses,
        'respondents': sum(values),
    }

    template = environment.get_template('likert.tex')
    with open('likert.tex', 'w') as f:
        f.write(template.render(context))

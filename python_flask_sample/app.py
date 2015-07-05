#!/usr/bin/env python
# -*- encoding: utf-8 -*-

import os
import time
import math

from flask import Flask, jsonify, request

app = Flask(__name__)
app.debug = False


def prime(max):
    table = [False] * max
    i_max = int(math.sqrt(max)) + 2

    if max < 3:
        return -1

    # init table
    table[0] = table[1] = True # 0 & 1 is not prime number

    # make table
    for i in range(2, i_max):
        if not table[i]:
            for j in range(i + i, max, i):
                table[j] = True

    # search
    for i in reversed(range(0, max - 1)):
        if not table[i]:
            return i

    return -1



@app.route('/benchmark/simple')
def simple():
    result = {
        'ok': True,
        'language': 'Python',
        'framework': 'Flask',
        'now': int(time.clock()),
    }
    return jsonify(result)


@app.route('/benchmark/cpu')
def cpu():
    max = int(request.args.get('max'))

    result = {
        'ok': True,
        'max': max,
        'result': prime(max),
    }
    return jsonify(result)



if __name__ == '__main__':
    app.run(port = int(os.environ['PORT']))

# vim: se et ts=8 sw=4 sts=4 ft=python :

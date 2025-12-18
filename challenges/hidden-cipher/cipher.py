import string

MAP = {k: v for k, v in zip(string.ascii_lowercase, reversed(string.ascii_lowercase))}

def encrypt(message):
    return ''.join(MAP.get(c, c) for c in message.lower())

if __name__ == '__main__':
    print(encrypt('vzhgzbwrmt'))
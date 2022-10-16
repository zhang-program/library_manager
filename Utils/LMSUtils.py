import base58

import pymysql

LEFT = '左边'
RIGHT = '右边'
UPPER = '上'
DOWNPER = '下'

class Encoder(object):
    def __init__(self, data):
        self.data = data
    
    def encode(self):
        return base58.b58encode_check(self.data)

class Decoder(object):
    def __init__(self, data):
        self.data = data
    
    def decode(self):
        return base58.b58decode_check(self.data)

class Management(object):
    

    def __init__(self, ip):
        self.conn = pymysql.connect(host=ip, port=3306, user='root', password='Yolanda@0118', database='lms', charset='utf8')
    
    def __del__(self):
        self.conn.close()
    
    def insert_data(self, name, data):
        cursor = self.conn.cursor()
        encoder = Encoder(data)
        data = encoder.encode()
        sql = 'insert into book_1 values (%s, %s);'
        cursor.execute(sql, [name, data])
        self.conn.commit()
        cursor.close()
    
    def delete_data(self, name):
        cursor = self.conn.cursor()
        sql = 'delete from book_1 where name=%s'
        cursor.execute(sql, [name])
        self.conn.commit()
        cursor.close()
    
    def update_data(self, name, data):
        cursor = self.conn.cursor()
        sql = 'update book_1 set address=%s where name=%s'
        cursor.execute(sql, [data, name])
        self.conn.commit()
        cursor.close()
    
    def get_data(self, name):
        cursor = self.conn.cursor(cursor=pymysql.cursors.DictCursor)
        sql = 'select * from book_1 where name=%s'
        cursor.execute(sql, [name])
        result = cursor.fetchone()
        if result is None:
            return None
        decoder = Decoder(result['address'])
        return decoder.decode()
    
    def get_data_string(self, name):
        data = self.get_data(name)
        return self.to_string(data)
    
    def to_string(self, data):
        if data is None:
            return '未找到图书'
        shelf = data[0]
        left_or_right = ''
        row = data[2]
        if data[1] == 1:
            left_or_right = LEFT
        elif data[1] == 2:
            left_or_right = RIGHT
        else:
            left_or_right = ''
        result = f'位置：{str(shelf)}号柜{left_or_right}的第{str(row)}行'
        return result
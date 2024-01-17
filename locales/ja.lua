local Translations = {
    error = {
        plate_notfound = '指定したプレートの車両はありません',
        already_in_garage = '指定したプレートの車両は既にガレージにあります',
        ingame_car_notfound = '指定したプレートの車両が空間上にありません'
    },
    success = {
        sended_garage = 'ガレージに戻しました',
        removed_ingame_car = '指定したプレートの車両を空間上から削除しました'
    },
    command = {
        gogarage = {
            help = '指定したプレートの車両をガレージへ戻します (Admin専用)',
            params = {
                plate = { name = 'ナンバープレート', help = 'ナンバープレートを入力してください(大文字小文字問わず)' }
            },
        },
        removeingamecar = {
            help = '指定したプレートの車両を空間上から削除します (Admin専用)',
            params = {
                plate = { name = 'ナンバープレート', help = 'ナンバープレートを入力してください(大文字小文字問わず)' }
            },
        },
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

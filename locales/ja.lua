local Translations = {
    error = {
        plate_notfound = '指定したプレートの乗り物はありません',
        already_in_garage = '指定したプレートの乗り物は既にガレージにあります',
    },
    success = {
        sended_garage = 'ガレージに戻しました',
    },
    commands = {
        ["gogarage_description"] = '指定したプレートの乗り物をガレージへ戻します (Admin専用)',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

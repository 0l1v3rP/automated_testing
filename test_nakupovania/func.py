try:
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False
class func:
    @keyword('VYNASOB')
    def vynasobHodnotu(self,hodnota,krat):
        text = f"{(int(krat) * float(hodnota[:-1].replace(',','.'))):.2f}".replace('.',',') + "€"
        if len(text) > 6:
            text = text[:-7] + " " + text[-7:]
        return text[:-1] + " " + text[-1:]
    

    @keyword('ZNIZ POCET')
    def znizPocet(self,pocet):
        return f"{int(pocet) - 1}"
from robot.api.deco import *
from robot.libraries.BuiltIn import *


@library
class Test:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def demo_world(self):
        a = 5
        b = 6
        c = a + b
        print("hello word", c)

    @keyword
    def items_to_be_added(self, productList):
        i = 1
        productTitle = self.selLib.get_webelements("css:.card-title")
        for listElement in productTitle:
            if listElement.text in productList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")
            i = i + 1

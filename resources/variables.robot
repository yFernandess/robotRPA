*** Variables ***
${URL}                  https://developer.clashroyale.com
${BROWSER}              chrome
${LOCATOR_LOGIN}        xpath=//div[@class='login-menu'][contains(.,'Register|Log In')]//a[contains(text(),'Log In')]
${LOCATOR_USER}         id=email
${LOCATOR_PASSWORD}     id=password
${USER}                 fernandes.yuri@hotmail.com
${PASSWORD}             testPrimeControl
${LOCATOR_LOGAR}        xpath=//button[@type='submit'][contains(.,'Log In')]
${LOCATOR_MENU}         xpath=//span[contains(@class,'dev-site-icon dev-site-icon-chevron-down')]
${LOCATOR_MINHA_CONTA}  xpath=//li[@data-reactid='.0.2.0.0.0.0.2.0.0.1.0'][contains(.,'My Account')]
${LOCATOR_NOVA_CHAVE}   xpath=//span[contains(.,'Create New Key')]
${LOCATOR_IP}           id=range-0
# ${IP}                   179.225.130.234
${LOCATOR_NOME_CHAVE}   id=name
${LOCATOR_DESC_CHAVE}   id=description
${LOCATOR_ADD_CHAVE}    xpath=//button[@type='submit'][contains(.,'Create Key')]
${LOCATOR_TOKEN}        xpath=//samp[contains(@data-reactid,'.0.2.0.1.0.0.0.1.0.0.1.0')]
${LOCATOR_MINHA_CHAVE}  xpath=//div[contains(@data-reactid,'.0.2.0.1.1.0.0.1.0.1:$')]
${LOCATOR_DEL_CHAVE}    xpath=//button[@type='submit'][contains(.,'Delete Key')]
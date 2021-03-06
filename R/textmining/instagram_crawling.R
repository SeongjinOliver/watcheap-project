library(RSelenium)
library(dplyr)
library(tibble)
library(stringr)
##id pw 설정
pyun.id<-"pyun_ma"
pyun.pw<-"rlavusqhr1234"
insta.file<-NULL #여기선 cu
insta.file.7<-NULL #seveneleven
insta.file.m<-NULL #ministop
insta.file.g<-NULL #gs25
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.instagram.com/explore/tags/gs25/'
remDr$navigate(url)
Sys.sleep(5)



##로그인
login.click<-remDr$findElement(using="css","#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.ctQZg > div > span > a:nth-child(1) > button")
login.click$clickElement()
input.id<-remDr$findElement(using="css","#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(2) > div > label > input")
input.id$sendKeysToElement(list(pyun.id))
input.pw<-remDr$findElement(using="css","#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(3) > div > label > input")
input.pw$sendKeysToElement(list(pyun.pw))
login.click<-remDr$findElement(using="css","#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(4) > button")
login.click$clickElement()
Sys.sleep(5)


##첫번째 게시물 클릭
first.click<-remDr$findElement(using="css","#react-root > section > main > article > div.EZdmt > div > div > div:nth-child(1) > div:nth-child(1)")
first.click$clickElement()



##게시글
repeat{
  tryCatch({
    article <-
      remDr$findElement(
        using = "css",
        "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > div.EtaWk > ul > div > li > div > div > div.C4VMK > span"
      )
    article <- unlist(article$getElementText())
    article %>%
      gsub("\\W", " ", .) %>%
      gsub("\\s+", " ", .) -> article
    
    insta <- data.frame(article = article)
    insta.file.g <- rbind(insta.file.g, insta)
    
    ##옆 게시물로 이동
    if (nrow(insta.file.g) == 1) {
      r.move <-
        remDr$findElement(using = "css", "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a")
    } else{
      r.move <-
        remDr$findElement(
          using = "css",
          " body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow"
        )
    }
    r.move$clickElement()
    
  },
  error = function(e) {
    r.move <-
      remDr$findElement(
        using = "css",
        " body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow"
      )
    r.move$clickElement()
    message(e)
    return(NA)
  },
  finally = {
    Sys.sleep(1)
  })
}
write.csv(insta.file,file="insta_cu.csv")
write.csv(insta.file.7,file="insta_seven.csv")
write.csv(insta.file.m,file="insta_ministop.csv")
write.csv(insta.file.g,file="insta_gs25.csv")


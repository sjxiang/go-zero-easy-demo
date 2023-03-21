package jwtx

import "github.com/golang-jwt/jwt/v4"


// seconds 有效期
func GenToken(scretKey  string, iat, seconds, uid int64) (string, error) {
	claims := make(jwt.MapClaims)
	// 过期时间戳
	claims["exp"] = iat + seconds
	// 签发时间戳  
	claims["iat"] = iat
	claims["uid"] = uid

	token := jwt.New(jwt.SigningMethodHS256)
	token.Claims = claims
	return token.SignedString([]byte(scretKey))
}
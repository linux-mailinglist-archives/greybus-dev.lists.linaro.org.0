Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AD1BE6D4
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2020 21:00:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AD1561891
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2020 19:00:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7BC4B61997; Wed, 29 Apr 2020 19:00:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1EF32619AC;
	Wed, 29 Apr 2020 19:00:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DFD1E61891
 for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2020 19:00:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D461561999; Wed, 29 Apr 2020 19:00:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by lists.linaro.org (Postfix) with ESMTPS id 2716C61997
 for <greybus-dev@lists.linaro.org>; Wed, 29 Apr 2020 19:00:39 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MEFfB-1jLvSk42HV-00AE83; Wed, 29 Apr 2020 21:00:24 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Axel Haslam <ahaslam@baylibre.com>
Date: Wed, 29 Apr 2020 21:00:09 +0200
Message-Id: <20200429190022.12671-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Mlh1BapjxIyzREDPZHO4Hsp4KHejN/8Ty1YIQCptm26zBMM5I3P
 wQTQKDgLNwYUCbAgRy4fe93olczzoNzwMHGD9JAaN5/yWKmh5SFbVNZfUZOS6Fx/8cAo3oi
 /azCZ5byWZRmS0620KRUL+RlGTToj0G0ZRT15dQ49siFwfOA5k+TUt8LYAOsL8Lm4800AQq
 9osmsZVASt7O7yqPQpkVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KGOa0CrtfLc=:CWMlEOVkWkLMggCRWjllmT
 wbM/3K/fRtpJ28a/tXXlV0dZxMoQegCX0a8EWZEqsT0gxOEsGbFmpi9Y/TjFxAG9ZD/es3WJi
 pZfVawR6Hz+z/JTUEVssBCpVXH7h2h5/FrOO9AGuS12Oqrv/wDzWgyKpIe/GS7xg4XLoweITD
 5w8nyW9cYFuGh8GoEq82RVqO7J/qbfcEiPcQ6CDpkA5NHHulX0N8az7QsQAMqW+kNWqQLU+ej
 0uQNHrxNbJM68U8KbgNfM4hW07bHN+SxCAecphVoOPiDhWQg3A/KuomKLXhq0ExjD847a8FpT
 KgPmN+zKVKhJCj9r1sNLRu9JumHKu5/KM4PcRgcX/9UV8AHWhPYISeM/oRNJjzm2TTKRTcSc5
 fZ8mtFc74F4yZEyxtEufzQc9AJIMGXZKKWwhHhXrUm/03bQFttRgy6foKMcvYN6BMAHPnh1+R
 fKhN48XsvrsVo4yVlOaZHai2tB3bzW2Jq2WSgfgLT5KLEv0aMYqxwtbqEXUosJeKZEwbJXLjI
 tSJRoAdQvnLjDUo716/qR3Dhrua60vBzngu0mWddP3PAhcQInGA9vdADtta4Qcc1b2ssrZ01l
 BUYU/9xybCkqzA3QeU8kQsB9hYBu03jxzE4m+pl2afsT5hizpm8cJuEB1KEDeblgZkYf7TrXy
 cyqU9pc3nExqtODcgmd2GAXOapIZdVyFQv3LPKdY7MYZD9ATIkzvF9vEoor0TDS7KKbe1fp0P
 5ckuxbImGobBOxpJRsaXahO5enR6X91hWfVLKJApkJ8ExESmf290qzGOeXWwD5aGo1evDQJVv
 vDHXeBjvIgG0KVouw0ZAXgjlMx38ZpQvdqkrLPgleiYzpvBxA4=
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@google.com>,
 Johan Hovold <johan@hovoldconsulting.com>
Subject: [greybus-dev] [PATCH] greybus: uart: fix uninitialized flow control
	variable
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Z2NjLTEwIHBvaW50cyBvdXQgYW4gdW5pbml0aWFsaXplZCB2YXJpYWJsZSB1c2U6Cgpkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmM6IEluIGZ1bmN0aW9uICdnYl90dHlfc2V0X3Rlcm1pb3Mn
Ogpkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmM6NTQwOjI0OiBlcnJvcjogJ25ld2xpbmUu
Zmxvd19jb250cm9sJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdl
cnJvcj11bmluaXRpYWxpemVkXQogIDU0MCB8ICAgbmV3bGluZS5mbG93X2NvbnRyb2wgfD0gR0Jf
U0VSSUFMX0FVVE9fUlRTQ1RTX0VOOwoKSW5zdGVhZCBvZiB1c2luZyB8PSBhbmQgJj0gb24gdGhl
IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUsIHVzZSBhCmRpcmVjdCBhc3NpZ25tZW50LgoKRml4ZXM6
IGU1NWMyNTIwNmQ1YyAoImdyZXlidXM6IHVhcnQ6IEhhbmRsZSBDUlRTQ1RTIGZsYWcgaW4gdGVy
bWlvcyIpClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQog
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3VhcnQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYwppbmRl
eCA1NWM1MTE0M2JiMDkuLjRmZmIzMzRjZDVjZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvdWFydC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYwpAQCAt
NTM3LDkgKzUzNyw5IEBAIHN0YXRpYyB2b2lkIGdiX3R0eV9zZXRfdGVybWlvcyhzdHJ1Y3QgdHR5
X3N0cnVjdCAqdHR5LAogCX0KIAogCWlmIChDX0NSVFNDVFModHR5KSAmJiBDX0JBVUQodHR5KSAh
PSBCMCkKLQkJbmV3bGluZS5mbG93X2NvbnRyb2wgfD0gR0JfU0VSSUFMX0FVVE9fUlRTQ1RTX0VO
OworCQluZXdsaW5lLmZsb3dfY29udHJvbCA9IEdCX1NFUklBTF9BVVRPX1JUU0NUU19FTjsKIAll
bHNlCi0JCW5ld2xpbmUuZmxvd19jb250cm9sICY9IH5HQl9TRVJJQUxfQVVUT19SVFNDVFNfRU47
CisJCW5ld2xpbmUuZmxvd19jb250cm9sID0gMDsKIAogCWlmIChtZW1jbXAoJmdiX3R0eS0+bGlu
ZV9jb2RpbmcsICZuZXdsaW5lLCBzaXplb2YobmV3bGluZSkpKSB7CiAJCW1lbWNweSgmZ2JfdHR5
LT5saW5lX2NvZGluZywgJm5ld2xpbmUsIHNpemVvZihuZXdsaW5lKSk7Ci0tIAoyLjI2LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==

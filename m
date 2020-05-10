Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A83801CD5B8
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2020 11:53:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D01A960696
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2020 09:53:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C2E796179D; Mon, 11 May 2020 09:53:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DABAB61875;
	Mon, 11 May 2020 09:50:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3102761778
 for <greybus-dev@lists.linaro.org>; Sun, 10 May 2020 10:15:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 19E9A6181D; Sun, 10 May 2020 10:15:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by lists.linaro.org (Postfix) with ESMTPS id 8737261778
 for <greybus-dev@lists.linaro.org>; Sun, 10 May 2020 10:15:12 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.229.196]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1Mgeo8-1iv4qq0miq-00hAdO; Sun, 10 May 2020 12:15:04 +0200
From: Oscar Carter <oscar.carter@gmx.com>
To: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 10 May 2020 12:14:26 +0200
Message-Id: <20200510101426.23631-1-oscar.carter@gmx.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ps47P7hYVAoS31u+W1goqC5mfPrNR/UEtJYg44fQfgXMP7xUMLR
 VyH32hTPzXF8DfglQWutmqHJQygU63dOrB5mN6HHOswWY/Q4ScyS4jj3LKp9UVJl3nhuWFe
 yf3FlT+KTGCBpvXsA6kf+esHXmEtMbut/1NvexTWaRH2WFcbZ9sSWHo4jpDWfWx2JgMVhOJ
 Ec8V+AP/T1B3/1EhuqEWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g/kiqP+Wlmc=:lF7MhoWLDll1mzH2Ei7uf3
 MhpX/geJXvT92bJd6tFNz6tnzeYK6kFCy2VHvY4v+v9fCBLRVNuIJ1Oh9xvjeH8Z8hXYdEUMy
 8+277b4AxH+9j9gCDMrZnEiXZBcfpwcPukj+5HnS4Wqarvr2mt7lO/sMfpNls04SIsEJUUgGS
 X2RJA3Azg9W3bZxF7bQ6/Uuoaxs5DihLoLkGSius8k2SZJyPk/EdTTpx2/+sHz9jRfUPNP43K
 HKOOjy3F5E5nB9q5KZB38ilYZLKRoGWmxaJx28cMsmdzRN5DGWSjHdYDElRivH7Us9hpAHaqN
 S7760GF5W84KwCLTrJe1uXDHnwDzjNAyferRRjP5qTxN+5Sm9lC1JuzxW8fD1mV4fSg/34wRJ
 4cu92mj7NuJGUj233GMs8cOWqrcdQZGxg3abLmmh4q/S3zNlNyIm9wgSFRHgsR7hr7zBh/gOF
 OGlROH5PyOBLup0djfevEPoM+qaVq/qdRk/u5v0Tqw4QvLJrw6wYnHFmvOzsQSHkiEJGBlpXU
 /cL8tyZXKin3EC88MppinNmMF4XHxaqS2qvQnjpO/Wxus29uG3wAHr4BXJgmhLchkuwwjT5aV
 MwU25wF1qFVIGRtQI6rdUOfIAtm4wxMJ0dHnyAlUZ9HzePkq/yk4RLODB8LuiSX7cUA+wmMs0
 iDc2vF3oJetpFIRaURZXIxIDsVP3+mi1eSnDD1nYrmas1vNrOE4q7XLwALvUkS8DvB1m9xIbN
 /S1DFpMGDKVoio2TtqYbI7hh++izSR7U0tQKE2oSzLZGlJnLlTtWFPwNncpnpVs7DEYpUbV5b
 EgszLtp2dqViYnc0w67UOh8ewyE63ZZc4DJp3FtCHnlepTwEV20qxM+X2xu60+gdQyJSs7R93
 BQtzFHibDlUdSLqUn7bhTOI7F39qvAU4hENfCTKMT3/0w40Q+WkSoNb5/GaRNeOWYFrSxOvKJ
 9M2Dl30rYcenAG5duzFEkdGY2U8Dbny2D4jM6SCT0PUqrzX3R3WQm3zIaoRbw7uFTbX2JSqgW
 TArH41REMiTHxkQHud0XsS0wDC1DKdDgmFPhOeVZ6uhJSgWtpzHNTCiz7haOcxPNAaKojzFXc
 IDsd31gqGn7hcdtKhr01i4u5xaQ18Q5VqF3o2aWp8+ISIP6UNBA3ZJWQ/DwmZKEvuIQOqfK5C
 /X3qmFJvSjWoUtRzRAMh13mY4CXeQrzU5FAyaDg3s+OggVESQprqeytijhN1v4nETkZh2uH1X
 E+1E88RE90iYt88GM
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 11 May 2020 09:50:40 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Oscar Carter <oscar.carter@gmx.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: Fix uninitialized scalar
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

SW4gdGhlICJnYl90dHlfc2V0X3Rlcm1pb3MiIGZ1bmN0aW9uIHRoZSAibmV3bGluZSIgdmFyaWFi
bGUgaXMgZGVjbGFyZWQKYnV0IG5vdCBpbml0aWFsaXplZC4gU28gdGhlICJmbG93X2NvbnRyb2wi
IG1lbWJlciBpcyBub3QgaW5pdGlhbGl6ZWQgYW5kCnRoZSBPUiAvIEFORCBvcGVyYXRpb25zIHdp
dGggaXRzZWxmIHJlc3VsdHMgaW4gYW4gdW5kZWZpbmVkIHZhbHVlIGluCnRoaXMgbWVtYmVyLgoK
VGhlIHB1cnBvc2Ugb2YgdGhlIGNvZGUgaXMgdG8gc2V0IHRoZSBmbG93IGNvbnRyb2wgdHlwZSwg
c28gcmVtb3ZlIHRoZQpPUiAvIEFORCBzZWxmIG9wZXJhdG9yIGFuZCBzZXQgdGhlIHZhbHVlIGRp
cmVjdGx5LgoKQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxMzc0MDE2ICgiVW5pbml0aWFsaXplZCBz
Y2FsYXIgdmFyaWFibGUiKQpGaXhlczogZTU1YzI1MjA2ZDVjOSAoImdyZXlidXM6IHVhcnQ6IEhh
bmRsZSBDUlRTQ1RTIGZsYWcgaW4gdGVybWlvcyIpClNpZ25lZC1vZmYtYnk6IE9zY2FyIENhcnRl
ciA8b3NjYXIuY2FydGVyQGdteC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFy
dC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYwppbmRleCA1NWM1MTE0M2JiMDkuLjRmZmIzMzRjZDVj
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCisrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYwpAQCAtNTM3LDkgKzUzNyw5IEBAIHN0YXRpYyB2b2lk
IGdiX3R0eV9zZXRfdGVybWlvcyhzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCX0KCiAJaWYgKENf
Q1JUU0NUUyh0dHkpICYmIENfQkFVRCh0dHkpICE9IEIwKQotCQluZXdsaW5lLmZsb3dfY29udHJv
bCB8PSBHQl9TRVJJQUxfQVVUT19SVFNDVFNfRU47CisJCW5ld2xpbmUuZmxvd19jb250cm9sID0g
R0JfU0VSSUFMX0FVVE9fUlRTQ1RTX0VOOwogCWVsc2UKLQkJbmV3bGluZS5mbG93X2NvbnRyb2wg
Jj0gfkdCX1NFUklBTF9BVVRPX1JUU0NUU19FTjsKKwkJbmV3bGluZS5mbG93X2NvbnRyb2wgPSAw
OwoKIAlpZiAobWVtY21wKCZnYl90dHktPmxpbmVfY29kaW5nLCAmbmV3bGluZSwgc2l6ZW9mKG5l
d2xpbmUpKSkgewogCQltZW1jcHkoJmdiX3R0eS0+bGluZV9jb2RpbmcsICZuZXdsaW5lLCBzaXpl
b2YobmV3bGluZSkpOwotLQoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0
cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dy
ZXlidXMtZGV2Cg==

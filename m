Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A329334072
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 15:40:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 44273618DF
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 14:40:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 35FB1665B5; Wed, 10 Mar 2021 14:40:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	HTML_MESSAGE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_MED,SPF_HELO_PASS
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03A246678F;
	Wed, 10 Mar 2021 14:39:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D3BC0618DF
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:39:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BD190665E9; Wed, 10 Mar 2021 14:39:37 +0000 (UTC)
Received: from ustc.edu.cn (smtp2.ustc.edu.cn [202.38.64.46])
 by lists.linaro.org (Postfix) with ESMTP id E3ECE665B5
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:39:34 +0000 (UTC)
Received: by ajax-webmail-newmailweb.ustc.edu.cn (Coremail) ; Wed, 10 Mar
 2021 22:39:29 +0800 (GMT+08:00)
X-Originating-IP: [202.79.170.108]
Date: Wed, 10 Mar 2021 22:39:29 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: lyl2019@mail.ustc.edu.cn
To: "Johan Hovold" <johan@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT3.0.8 dev build
 20190610(cb3344cf) Copyright (c) 2002-2021 www.mailtech.cn ustc-xl
In-Reply-To: <YEjWQObSkj6QbXZP@hovoldconsulting.com>
References: <20210310141736.3459-1-lyl2019@mail.ustc.edu.cn>
 <YEjWQObSkj6QbXZP@hovoldconsulting.com>
X-SendMailWithSms: false
MIME-Version: 1.0
Message-ID: <39bafc15.a0b0.1781c9410f3.Coremail.lyl2019@mail.ustc.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LkAmygC3v5Mh2khg+e0EAA--.0W
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/1tbiAQsQBlQhn495HwAFsa
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH v2] greybus/operation: Drop reference when
 message has been sent
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
Content-Type: multipart/mixed; boundary="===============7999463529483186191=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============7999463529483186191==
Content-Type: multipart/alternative; 
	boundary="----=_Part_142676_518995282.1615387169010"

------=_Part_142676_518995282.1615387169010
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T2ssIGdyZXlidXNfbWVzc2FnZV9zZW50KCkgaXMgdG9vIGNvbXBsaWNhdGVkIGEgZnVuY3Rpb24s
IGkgd2lsbCBjaGVjayBpdCBhZ2Fpbi4KClRoYW5rcyBmb3IgeW91ciB0aW1lLgoKCj4gLS0tLS3l
jp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIkpvaGFuIEhvdm9sZCIgPGpvaGFuQGtlcm5l
bC5vcmc+Cj4g5Y+R6YCB5pe26Ze0OiAyMDIxLTAzLTEwIDIyOjIyOjU2ICjmmJ/mnJ/kuIkpCj4g
5pS25Lu25Lq6OiAiTHYgWXVubG9uZyIgPGx5bDIwMTlAbWFpbC51c3RjLmVkdS5jbj4KPiDmioTp
gIE6IGVsZGVyQGtlcm5lbC5vcmcsIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnLCBncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g5Li7
6aKYOiBSZTogW1BBVENIIHYyXSBncmV5YnVzL29wZXJhdGlvbjogRHJvcCByZWZlcmVuY2Ugd2hl
biBtZXNzYWdlIGhhcyBiZWVuIHNlbnQKPgo+IE9uIFdlZCwgTWFyIDEwLCAyMDIxIGF0IDA2OjE3
OjM2QU0gLTA4MDAsIEx2IFl1bmxvbmcgd3JvdGU6Cj4gPiBJbiBnYl9vcGVyYXRpb25fcmVzcG9u
c2Vfc2VuZCwgZ2V0IGFuIGV4dHJhIHJlZmVyZW5jZQo+ID4gYmVmb3JlIGdiX21lc3NhZ2Vfc2Vu
ZCgpIHdpdGggdGhpcyBjb21tZW50ICIvKiBSZWZlcmVuY2Ugd2lsbAo+ID4gYmUgZHJvcHBlZCB3
aGVuIG1lc3NhZ2UgaGFzIGJlZW4gc2VudC4gKi8iLiBUaGVyZWZvcmUsIHdlCj4gPiBzaG91bGQg
ZHJvcCB0aGUgZ290IHJlZmVyZW5jZSBub3Qgb25seSBpbiB0aGUgZXJyb3IgYnJhbmNoLAo+ID4g
YnV0IGFsc28gaW4gdGhlIGNvbXBsZXRlIGJyYW5jaC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBM
diBZdW5sb25nIDxseWwyMDE5QG1haWwudXN0Yy5lZHUuY24+Cj4gPiAtLS0KPiA+IGRyaXZlcnMv
Z3JleWJ1cy9vcGVyYXRpb24uYyB8IDQgKysrKwo+ID4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMg
Yi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMKPiA+IGluZGV4IDg0NTllOWJjMDc0OS4uNTAw
YjNmZTUzYTA0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jCj4g
PiArKysgYi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMKPiA+IEBAIC04NTUsNiArODU1LDEw
IEBAIHN0YXRpYyBpbnQgZ2Jfb3BlcmF0aW9uX3Jlc3BvbnNlX3NlbmQoc3RydWN0IGdiX29wZXJh
dGlvbiAqb3BlcmF0aW9uLAo+ID4gaWYgKHJldCkKPiA+IGdvdG8gZXJyX3B1dF9hY3RpdmU7Cj4g
Pgo+ID4gKyAvKkRyb3AgcmVmZXJlbmNlIGFmdGVyIG1lc3NhZ2Ugc2VuZCBjb21wbGV0ZXMuICov
Cj4gPiArIGdiX29wZXJhdGlvbl9wdXRfYWN0aXZlKG9wZXJhdGlvbik7Cj4gPiArIGdiX29wZXJh
dGlvbl9wdXQob3BlcmF0aW9uKTsKPgo+IE5vLCB0aGlzIGlzIGJyb2tlbi4KPgo+IFRoZSByZWZl
cmVuY2UgaXMgZHJvcHBlZCBpbiBncmV5YnVzX21lc3NhZ2Vfc2VudCgpLgo+Cj4gSm9oYW4K
------=_Part_142676_518995282.1615387169010
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

T2ssIGdyZXlidXNfbWVzc2FnZV9zZW50KCkgaXMgdG9vIGNvbXBsaWNhdGVkIGEgZnVuY3Rpb24s
IGkgd2lsbCBjaGVjayBpdCBhZ2Fpbi48YnI+PGJyPlRoYW5rcyBmb3IgeW91ciB0aW1lLjxicj48
YnI+PGJyPiZndDsgLS0tLS3ljp/lp4vpgq7ku7YtLS0tLTxicj4mZ3Q7IOWPkeS7tuS6ujogIkpv
aGFuIEhvdm9sZCIgJmx0O2pvaGFuQGtlcm5lbC5vcmcmZ3Q7PGJyPiZndDsg5Y+R6YCB5pe26Ze0
OiAyMDIxLTAzLTEwIDIyOjIyOjU2ICjmmJ/mnJ/kuIkpPGJyPiZndDsg5pS25Lu25Lq6OiAiTHYg
WXVubG9uZyIgJmx0O2x5bDIwMTlAbWFpbC51c3RjLmVkdS5jbiZndDs8YnI+Jmd0OyDmioTpgIE6
IGVsZGVyQGtlcm5lbC5vcmcsIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnLCBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPGJyPiZndDsg
5Li76aKYOiBSZTogW1BBVENIIHYyXSBncmV5YnVzL29wZXJhdGlvbjogRHJvcCByZWZlcmVuY2Ug
d2hlbiBtZXNzYWdlIGhhcyBiZWVuIHNlbnQ8YnI+Jmd0OyA8YnI+Jmd0OyBPbiBXZWQsIE1hciAx
MCwgMjAyMSBhdCAwNjoxNzozNkFNIC0wODAwLCBMdiBZdW5sb25nIHdyb3RlOjxicj4mZ3Q7ICZn
dDsgSW4gZ2Jfb3BlcmF0aW9uX3Jlc3BvbnNlX3NlbmQsIGdldCBhbiBleHRyYSByZWZlcmVuY2U8
YnI+Jmd0OyAmZ3Q7IGJlZm9yZSBnYl9tZXNzYWdlX3NlbmQoKSB3aXRoIHRoaXMgY29tbWVudCAi
LyogUmVmZXJlbmNlIHdpbGw8YnI+Jmd0OyAmZ3Q7IGJlIGRyb3BwZWQgd2hlbiBtZXNzYWdlIGhh
cyBiZWVuIHNlbnQuICovIi4gVGhlcmVmb3JlLCB3ZTxicj4mZ3Q7ICZndDsgc2hvdWxkIGRyb3Ag
dGhlIGdvdCByZWZlcmVuY2Ugbm90IG9ubHkgaW4gdGhlIGVycm9yIGJyYW5jaCw8YnI+Jmd0OyAm
Z3Q7IGJ1dCBhbHNvIGluIHRoZSBjb21wbGV0ZSBicmFuY2guPGJyPiZndDsgJmd0OyA8YnI+Jmd0
OyAmZ3Q7IFNpZ25lZC1vZmYtYnk6IEx2IFl1bmxvbmcgJmx0O2x5bDIwMTlAbWFpbC51c3RjLmVk
dS5jbiZndDs8YnI+Jmd0OyAmZ3Q7IC0tLTxicj4mZ3Q7ICZndDsgZHJpdmVycy9ncmV5YnVzL29w
ZXJhdGlvbi5jIHwgNCArKysrPGJyPiZndDsgJmd0OyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspPGJyPiZndDsgJmd0OyA8YnI+Jmd0OyAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dy
ZXlidXMvb3BlcmF0aW9uLmMgYi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmM8YnI+Jmd0OyAm
Z3Q7IGluZGV4IDg0NTllOWJjMDc0OS4uNTAwYjNmZTUzYTA0IDEwMDY0NDxicj4mZ3Q7ICZndDsg
LS0tIGEvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jPGJyPiZndDsgJmd0OyArKysgYi9kcml2
ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmM8YnI+Jmd0OyAmZ3Q7IEBAIC04NTUsNiArODU1LDEwIEBA
IHN0YXRpYyBpbnQgZ2Jfb3BlcmF0aW9uX3Jlc3BvbnNlX3NlbmQoc3RydWN0IGdiX29wZXJhdGlv
biAqb3BlcmF0aW9uLDxicj4mZ3Q7ICZndDsgCWlmIChyZXQpPGJyPiZndDsgJmd0OyAJCWdvdG8g
ZXJyX3B1dF9hY3RpdmU7PGJyPiZndDsgJmd0OyA8YnI+Jmd0OyAmZ3Q7ICsJLypEcm9wIHJlZmVy
ZW5jZSBhZnRlciBtZXNzYWdlIHNlbmQgY29tcGxldGVzLiAqLzxicj4mZ3Q7ICZndDsgKwlnYl9v
cGVyYXRpb25fcHV0X2FjdGl2ZShvcGVyYXRpb24pOzxicj4mZ3Q7ICZndDsgKwlnYl9vcGVyYXRp
b25fcHV0KG9wZXJhdGlvbik7PGJyPiZndDsgPGJyPiZndDsgTm8sIHRoaXMgaXMgYnJva2VuLjxi
cj4mZ3Q7IDxicj4mZ3Q7IFRoZSByZWZlcmVuY2UgaXMgZHJvcHBlZCBpbiBncmV5YnVzX21lc3Nh
Z2Vfc2VudCgpLjxicj4mZ3Q7IDxicj4mZ3Q7IEpvaGFuPGJyPg==
------=_Part_142676_518995282.1615387169010--


--===============7999463529483186191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============7999463529483186191==--


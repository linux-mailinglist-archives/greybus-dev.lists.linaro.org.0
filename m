Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E99C236
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 07:57:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D17F615AF
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 05:57:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6B12A61752; Sun, 25 Aug 2019 05:57:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 97E75618B9;
	Sun, 25 Aug 2019 05:55:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C844E617C8
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B2118617CC; Sun, 25 Aug 2019 05:55:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B7D98617C8
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:01 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EF832173E;
 Sun, 25 Aug 2019 05:55:00 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org
Date: Sun, 25 Aug 2019 07:54:22 +0200
Message-Id: <20190825055429.18547-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>
Subject: [greybus-dev] [PATCH 2/9] staging: greybus: remove license
	"boilerplate"
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

V2hlbiB0aGUgZ3JleWJ1cyBkcml2ZXJzIHdlcmUgY29udmVydGVkIHRvIFNQRFggaWRlbnRpZmll
cnMgZm9yIHRoZQpsaWNlbnNlIHRleHQsIHNvbWUgbGljZW5zZSBib2lsZXJwbGF0ZSB3YXMgbm90
IHJlbW92ZWQuICBDbGVhbiB0aGlzIHVwCmJ5IHJlbW92aW5nIHRoaXMgdW5uZWVkZWQgdGV4dCBu
b3cuCgpDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgpDYzogQWxleCBFbGRlciA8
ZWxkZXJAa2VybmVsLm9yZz4KQ2M6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5j
b20+CkNjOiBNYXJrIEdyZWVyIDxtZ3JlZXJAYW5pbWFsY3JlZWsuY29tPgpDYzogVmlyZXNoIEt1
bWFyIDx2aXJlc2hrQGtlcm5lbC5vcmc+CkNjOiAiQnJ5YW4gTydEb25vZ2h1ZSIgPHB1cmUubG9n
aWNAbmV4dXMtc29mdHdhcmUuaWU+CkNjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCkNj
OiBkZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIC4uLi9Eb2N1bWVudGF0aW9u
L2Zpcm13YXJlL2F1dGhlbnRpY2F0ZS5jICAgICB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Li9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUuYyB8IDQ2IC0tLS0tLS0t
LS0tLS0tLS0tLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FycGMuaCAgICAgICAgICAgICAg
ICB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlv
X2FwYnJpZGdlYS5oICAgICB8IDI2ICstLS0tLS0tLS0tCiAuLi4vc3RhZ2luZy9ncmV5YnVzL2dy
ZXlidXNfYXV0aGVudGljYXRpb24uaCAgfCA0NiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX2Zpcm13YXJlLmggICAgfCA0NiAtLS0tLS0tLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oICAgfCA0
NiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29w
YmFja190ZXN0LmMgfCAgMiAtCiA4IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzMDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1l
bnRhdGlvbi9maXJtd2FyZS9hdXRoZW50aWNhdGUuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L0RvY3VtZW50YXRpb24vZmlybXdhcmUvYXV0aGVudGljYXRlLmMKaW5kZXggODA2ZTc1YjdmNDA1
Li4zZDJjNmY4OGExMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3Vt
ZW50YXRpb24vZmlybXdhcmUvYXV0aGVudGljYXRlLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9hdXRoZW50aWNhdGUuYwpAQCAtMiw1NCArMiw4
IEBACiAvKgogICogU2FtcGxlIGNvZGUgdG8gdGVzdCBDQVAgcHJvdG9jb2wKICAqCi0gKiBUaGlz
IGZpbGUgaXMgcHJvdmlkZWQgdW5kZXIgYSBkdWFsIEJTRC9HUEx2MiBsaWNlbnNlLiAgV2hlbiB1
c2luZyBvcgotICogcmVkaXN0cmlidXRpbmcgdGhpcyBmaWxlLCB5b3UgbWF5IGRvIHNvIHVuZGVy
IGVpdGhlciBsaWNlbnNlLgotICoKLSAqIEdQTCBMSUNFTlNFIFNVTU1BUlkKLSAqCiAgKiBDb3B5
cmlnaHQoYykgMjAxNiBHb29nbGUgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgogICogQ29weXJp
Z2h0KGMpIDIwMTYgTGluYXJvIEx0ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KLSAqCi0gKiBUaGlz
IHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
IG1vZGlmeQotICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHZlcnNpb24gMiBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgYXMKLSAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLgotICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUg
aG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLCBidXQKLSAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZ
OyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1FUkNIQU5UQUJJTElU
WSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCi0gKiBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBmb3IgbW9yZSBkZXRhaWxzLgotICoKLSAq
IEJTRCBMSUNFTlNFCi0gKgotICogQ29weXJpZ2h0KGMpIDIwMTYgR29vZ2xlIEluYy4gQWxsIHJp
Z2h0cyByZXNlcnZlZC4KLSAqIENvcHlyaWdodChjKSAyMDE2IExpbmFybyBMdGQuIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCi0gKgotICogUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5k
IGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0Ci0gKiBtb2RpZmljYXRpb24sIGFyZSBwZXJt
aXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKLSAqIGFyZSBtZXQ6
Ci0gKgotICogICogUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11c3QgcmV0YWluIHRo
ZSBhYm92ZSBjb3B5cmlnaHQKLSAqICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMg
YW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KLSAqICAqIFJlZGlzdHJpYnV0aW9ucyBpbiBi
aW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0Ci0gKiAgICBub3Rp
Y2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIg
aW4KLSAqICAgIHRoZSBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlk
ZWQgd2l0aCB0aGUKLSAqICAgIGRpc3RyaWJ1dGlvbi4KLSAqICAqIE5laXRoZXIgdGhlIG5hbWUg
b2YgR29vZ2xlIEluYy4gb3IgTGluYXJvIEx0ZC4gbm9yIHRoZSBuYW1lcyBvZgotICogICAgaXRz
IGNvbnRyaWJ1dG9ycyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMK
LSAqICAgIGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Ig
d3JpdHRlbgotICogICAgcGVybWlzc2lvbi4KLSAqCi0gKiBUSElTIFNPRlRXQVJFIElTIFBST1ZJ
REVEIEJZIFRIRSBDT1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTCi0gKiAiQVMgSVMi
IEFORCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5P
VAotICogTElNSVRFRCBUTywgVEhFIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJ
VFkgQU5EIEZJVE5FU1MgRk9SCi0gKiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElTQ0xBSU1F
RC4gSU4gTk8gRVZFTlQgU0hBTEwgR09PR0xFIElOQy4gT1IKLSAqIExJTkFSTyBMVEQuIEJFIExJ
QUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsIElOQ0lERU5UQUwsIFNQRUNJQUwsCi0gKiBF
WEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UIExJ
TUlURUQgVE8sCi0gKiBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdPT0RTIE9SIFNFUlZJQ0VT
OyBMT1NTIE9GIFVTRSwgREFUQSwgT1IKLSAqIFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQ
VElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkKLSAqIE9GIExJQUJJTElUWSwg
V0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVAotICogKElOQ0xV
RElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBU
SEUgVVNFCi0gKiBPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJ
QklMSVRZIE9GIFNVQ0ggREFNQUdFLgogICovCiAKICNpbmNsdWRlIDxzdGRpby5oPgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJt
d2FyZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9m
aXJtd2FyZS5jCmluZGV4IDMxZDljMjNlMmVlYi4uNzY1ZDY5ZmFhOWNjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9Eb2N1bWVudGF0aW9uL2Zpcm13YXJlL2Zpcm13YXJlLmMK
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJt
d2FyZS5jCkBAIC0yLDU0ICsyLDggQEAKIC8qCiAgKiBTYW1wbGUgY29kZSB0byB0ZXN0IGZpcm13
YXJlLW1hbmFnZW1lbnQgcHJvdG9jb2wKICAqCi0gKiBUaGlzIGZpbGUgaXMgcHJvdmlkZWQgdW5k
ZXIgYSBkdWFsIEJTRC9HUEx2MiBsaWNlbnNlLiAgV2hlbiB1c2luZyBvcgotICogcmVkaXN0cmli
dXRpbmcgdGhpcyBmaWxlLCB5b3UgbWF5IGRvIHNvIHVuZGVyIGVpdGhlciBsaWNlbnNlLgotICoK
LSAqIEdQTCBMSUNFTlNFIFNVTU1BUlkKLSAqCiAgKiBDb3B5cmlnaHQoYykgMjAxNiBHb29nbGUg
SW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgogICogQ29weXJpZ2h0KGMpIDIwMTYgTGluYXJvIEx0
ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHZlcnNpb24gMiBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMKLSAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgotICoKLSAq
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLCBidXQKLSAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGlt
cGxpZWQgd2FycmFudHkgb2YKLSAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCi0gKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IHZlcnNpb24gMiBmb3IgbW9yZSBkZXRhaWxzLgotICoKLSAqIEJTRCBMSUNFTlNFCi0gKgotICog
Q29weXJpZ2h0KGMpIDIwMTYgR29vZ2xlIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KLSAqIENv
cHlyaWdodChjKSAyMDE2IExpbmFybyBMdGQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCi0gKgotICog
UmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBv
ciB3aXRob3V0Ci0gKiBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0
aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKLSAqIGFyZSBtZXQ6Ci0gKgotICogICogUmVkaXN0cmli
dXRpb25zIG9mIHNvdXJjZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKLSAq
ICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlz
Y2xhaW1lci4KLSAqICAqIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJv
ZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0Ci0gKiAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25k
aXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4KLSAqICAgIHRoZSBkb2N1bWVu
dGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUKLSAqICAgIGRp
c3RyaWJ1dGlvbi4KLSAqICAqIE5laXRoZXIgdGhlIG5hbWUgb2YgR29vZ2xlIEluYy4gb3IgTGlu
YXJvIEx0ZC4gbm9yIHRoZSBuYW1lcyBvZgotICogICAgaXRzIGNvbnRyaWJ1dG9ycyBtYXkgYmUg
dXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMKLSAqICAgIGRlcml2ZWQgZnJvbSB0
aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Igd3JpdHRlbgotICogICAgcGVybWlz
c2lvbi4KLSAqCi0gKiBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRIRSBDT1BZUklHSFQg
SE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTCi0gKiAiQVMgSVMiIEFORCBBTlkgRVhQUkVTUyBPUiBJ
TVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVAotICogTElNSVRFRCBUTywgVEhF
IElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SCi0g
KiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4gSU4gTk8gRVZFTlQgU0hBTEwg
R09PR0xFIElOQy4gT1IKLSAqIExJTkFSTyBMVEQuIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwg
SU5ESVJFQ1QsIElOQ0lERU5UQUwsIFNQRUNJQUwsCi0gKiBFWEVNUExBUlksIE9SIENPTlNFUVVF
TlRJQUwgREFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sCi0gKiBQUk9DVVJF
TUVOVCBPRiBTVUJTVElUVVRFIEdPT0RTIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwg
T1IKLSAqIFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQg
QU5EIE9OIEFOWSBUSEVPUlkKLSAqIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwg
U1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVAotICogKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9U
SEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFCi0gKiBPRiBUSElTIFNP
RlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdF
LgogICovCiAKICNpbmNsdWRlIDxzdGRpby5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYXJwYy5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJwYy5oCmluZGV4IDNk
YWI2Mzc1OTA5Yy4uYzhiODNjNWNmYTc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hcnBjLmgKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJwYy5oCkBAIC0xLDUz
ICsxLDcgQEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMy1D
bGF1c2UpICovCiAvKgotICogVGhpcyBmaWxlIGlzIHByb3ZpZGVkIHVuZGVyIGEgZHVhbCBCU0Qv
R1BMdjIgbGljZW5zZS4gIFdoZW4gdXNpbmcgb3IKLSAqIHJlZGlzdHJpYnV0aW5nIHRoaXMgZmls
ZSwgeW91IG1heSBkbyBzbyB1bmRlciBlaXRoZXIgbGljZW5zZS4KLSAqCi0gKiBHUEwgTElDRU5T
RSBTVU1NQVJZCi0gKgogICogQ29weXJpZ2h0KGMpIDIwMTYgR29vZ2xlIEluYy4gQWxsIHJpZ2h0
cyByZXNlcnZlZC4KICAqIENvcHlyaWdodChjKSAyMDE2IExpbmFybyBMdGQuIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKLSAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB2
ZXJzaW9uIDIgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCi0gKiBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KLSAqCi0gKiBUaGlzIHByb2dyYW0g
aXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwgYnV0Ci0g
KiBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mCi0gKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UuICBTZWUgdGhlIEdOVQotICogR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgZm9y
IG1vcmUgZGV0YWlscy4KLSAqCi0gKiBCU0QgTElDRU5TRQotICoKLSAqIENvcHlyaWdodChjKSAy
MDE2IEdvb2dsZSBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCi0gKiBDb3B5cmlnaHQoYykgMjAx
NiBMaW5hcm8gTHRkLiBBbGwgcmlnaHRzIHJlc2VydmVkLgotICoKLSAqIFJlZGlzdHJpYnV0aW9u
IGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAotICog
bW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zCi0gKiBhcmUgbWV0OgotICoKLSAqICAqIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3Vy
Y2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0Ci0gKiAgICBub3RpY2UsIHRo
aXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuCi0gKiAg
KiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3Zl
IGNvcHlyaWdodAotICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhl
IGZvbGxvd2luZyBkaXNjbGFpbWVyIGluCi0gKiAgICB0aGUgZG9jdW1lbnRhdGlvbiBhbmQvb3Ig
b3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlCi0gKiAgICBkaXN0cmlidXRpb24uCi0g
KiAgKiBOZWl0aGVyIHRoZSBuYW1lIG9mIEdvb2dsZSBJbmMuIG9yIExpbmFybyBMdGQuIG5vciB0
aGUgbmFtZXMgb2YKLSAqICAgIGl0cyBjb250cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3Jz
ZSBvciBwcm9tb3RlIHByb2R1Y3RzCi0gKiAgICBkZXJpdmVkIGZyb20gdGhpcyBzb2Z0d2FyZSB3
aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0ZW4KLSAqICAgIHBlcm1pc3Npb24uCi0gKgotICog
VEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENP
TlRSSUJVVE9SUwotICogIkFTIElTIiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5U
SUVTLCBJTkNMVURJTkcsIEJVVCBOT1QKLSAqIExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJB
TlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUgotICogQSBQQVJUSUNVTEFS
IFBVUlBPU0UgQVJFIERJU0NMQUlNRUQuIElOIE5PIEVWRU5UIFNIQUxMIEdPT0dMRSBJTkMuIE9S
Ci0gKiBMSU5BUk8gTFRELiBCRSBMSUFCTEUgRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJ
REVOVEFMLCBTUEVDSUFMLAotICogRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMg
KElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLAotICogUFJPQ1VSRU1FTlQgT0YgU1VCU1RJ
VFVURSBHT09EUyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0UsIERBVEEsIE9SCi0gKiBQUk9GSVRT
OyBPUiBCVVNJTkVTUyBJTlRFUlJVUFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFORCBPTiBBTlkgVEhF
T1JZCi0gKiBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJ
VFksIE9SIFRPUlQKLSAqIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJ
TkcgSU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRQotICogT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJ
RiBBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4KICAqLwogCiAjaWZu
ZGVmIF9fQVJQQ19ICmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19h
cGJyaWRnZWEuaCBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2FwYnJpZGdlYS5oCmlu
ZGV4IDMzMGZjN2EzOTdlYi4uM2YxZjRkZDJjNjFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19hcGJyaWRnZWEuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19hcGJyaWRnZWEuaApAQCAtMSwzMCArMSw2IEBACiAvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogQlNELTMtQ2xhdXNlICovCi0vKioKKy8qCiAgKiBDb3B5cmlnaHQgKGMpIDIwMTUt
MjAxNiBHb29nbGUgSW5jLgotICogQWxsIHJpZ2h0cyByZXNlcnZlZC4KLSAqCi0gKiBSZWRpc3Ry
aWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhv
dXQKLSAqIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xs
b3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0OgotICogMS4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJj
ZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlLAotICogdGhpcyBs
aXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KLSAqIDIuIFJl
ZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29w
eXJpZ2h0IG5vdGljZSwKLSAqIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93
aW5nIGRpc2NsYWltZXIgaW4gdGhlIGRvY3VtZW50YXRpb24KLSAqIGFuZC9vciBvdGhlciBtYXRl
cmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgotICogMy4gTmVpdGhlciB0aGUg
bmFtZSBvZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3IgdGhlIG5hbWVzIG9mIGl0cwotICogY29u
dHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cyBkZXJp
dmVkIGZyb20gdGhpcwotICogc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVu
IHBlcm1pc3Npb24uCi0gKgotICogVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUgQ09Q
WVJJR0hUIEhPTERFUlMgQU5EIENPTlRSSUJVVE9SUyAiQVMgSVMiCi0gKiBBTkQgQU5ZIEVYUFJF
U1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywK
LSAqIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIKLSAqIFBVUlBPU0UgQVJFIERJU0NMQUlNRUQuIElOIE5PIEVWRU5U
IFNIQUxMIFRIRSBDT1BZUklHSFQgSE9MREVSIE9SCi0gKiBDT05UUklCVVRPUlMgQkUgTElBQkxF
IEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwKLSAqIEVYRU1Q
TEFSWSwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRF
RCBUTywKLSAqIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMgT1IgU0VSVklDRVM7IExP
U1MgT0YgVVNFLCBEQVRBLCBPUiBQUk9GSVRTOwotICogT1IgQlVTSU5FU1MgSU5URVJSVVBUSU9O
KSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFCSUxJVFksCi0gKiBXSEVU
SEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUIChJTkNMVURJTkcgTkVH
TElHRU5DRSBPUgotICogT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBV
U0UgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRgotICogQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJ
VFkgT0YgU1VDSCBEQU1BR0UuCiAgKi8KIC8qCiAgKiBUaGlzIGlzIGEgc3BlY2lhbCBwcm90b2Nv
bCBmb3IgY29uZmlndXJpbmcgY29tbXVuaWNhdGlvbiBvdmVyIHRoZQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19hdXRoZW50aWNhdGlvbi5oIGIvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvZ3JleWJ1c19hdXRoZW50aWNhdGlvbi5oCmluZGV4IGQ2NTQ3NjBjZjE3
NS4uN2VkYzcyOTViN2FiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5
YnVzX2F1dGhlbnRpY2F0aW9uLmgKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1
c19hdXRoZW50aWNhdGlvbi5oCkBAIC0yLDU0ICsyLDggQEAKIC8qCiAgKiBHcmV5YnVzIENvbXBv
bmVudCBBdXRoZW50aWNhdGlvbiBVc2VyIEhlYWRlcgogICoKLSAqIFRoaXMgZmlsZSBpcyBwcm92
aWRlZCB1bmRlciBhIGR1YWwgQlNEL0dQTHYyIGxpY2Vuc2UuICBXaGVuIHVzaW5nIG9yCi0gKiBy
ZWRpc3RyaWJ1dGluZyB0aGlzIGZpbGUsIHlvdSBtYXkgZG8gc28gdW5kZXIgZWl0aGVyIGxpY2Vu
c2UuCi0gKgotICogR1BMIExJQ0VOU0UgU1VNTUFSWQotICoKICAqIENvcHlyaWdodChjKSAyMDE2
IEdvb2dsZSBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCiAgKiBDb3B5cmlnaHQoYykgMjAxNiBM
aW5hcm8gTHRkLiBBbGwgcmlnaHRzIHJlc2VydmVkLgotICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdmVyc2lvbiAyIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24u
Ci0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQg
d2lsbCBiZSB1c2VmdWwsIGJ1dAotICogV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZl
biB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKLSAqIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgdmVyc2lvbiAyIGZvciBtb3JlIGRldGFpbHMuCi0gKgotICogQlNEIExJQ0VOU0UK
LSAqCi0gKiBDb3B5cmlnaHQoYykgMjAxNiBHb29nbGUgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVk
LgotICogQ29weXJpZ2h0KGMpIDIwMTYgTGluYXJvIEx0ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4K
LSAqCi0gKiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1z
LCB3aXRoIG9yIHdpdGhvdXQKLSAqIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRl
ZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucwotICogYXJlIG1ldDoKLSAqCi0gKiAgKiBS
ZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHly
aWdodAotICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxv
d2luZyBkaXNjbGFpbWVyLgotICogICogUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11
c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKLSAqICAgIG5vdGljZSwgdGhpcyBsaXN0
IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbgotICogICAgdGhl
IGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZQot
ICogICAgZGlzdHJpYnV0aW9uLgotICogICogTmVpdGhlciB0aGUgbmFtZSBvZiBHb29nbGUgSW5j
LiBvciBMaW5hcm8gTHRkLiBub3IgdGhlIG5hbWVzIG9mCi0gKiAgICBpdHMgY29udHJpYnV0b3Jz
IG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cwotICogICAgZGVyaXZl
ZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuCi0gKiAg
ICBwZXJtaXNzaW9uLgotICoKLSAqIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENP
UFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMKLSAqICJBUyBJUyIgQU5EIEFOWSBFWFBS
RVNTIE9SIElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UCi0gKiBMSU1JVEVE
IFRPLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVT
UyBGT1IKLSAqIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRSBESVNDTEFJTUVELiBJTiBOTyBFVkVO
VCBTSEFMTCBHT09HTEUgSU5DLiBPUgotICogTElOQVJPIExURC4gQkUgTElBQkxFIEZPUiBBTlkg
RElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwKLSAqIEVYRU1QTEFSWSwgT1Ig
Q09OU0VRVUVOVElBTCBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywKLSAq
IFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNF
LCBEQVRBLCBPUgotICogUFJPRklUUzsgT1IgQlVTSU5FU1MgSU5URVJSVVBUSU9OKSBIT1dFVkVS
IENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWQotICogT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENP
TlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUCi0gKiAoSU5DTFVESU5HIE5FR0xJR0VO
Q0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UKLSAqIE9G
IFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VD
SCBEQU1BR0UuCiAgKi8KIAogI2lmbmRlZiBfX0dSRVlCVVNfQVVUSEVOVElDQVRJT05fVVNFUl9I
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX2Zpcm13YXJlLmgg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX2Zpcm13YXJlLmgKaW5kZXggMTNlZjNh
YTUyNzllLi5mNjhmZDVlMjUzMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2dyZXlidXNfZmlybXdhcmUuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVz
X2Zpcm13YXJlLmgKQEAgLTIsNTQgKzIsOCBAQAogLyoKICAqIEdyZXlidXMgRmlybXdhcmUgTWFu
YWdlbWVudCBVc2VyIEhlYWRlcgogICoKLSAqIFRoaXMgZmlsZSBpcyBwcm92aWRlZCB1bmRlciBh
IGR1YWwgQlNEL0dQTHYyIGxpY2Vuc2UuICBXaGVuIHVzaW5nIG9yCi0gKiByZWRpc3RyaWJ1dGlu
ZyB0aGlzIGZpbGUsIHlvdSBtYXkgZG8gc28gdW5kZXIgZWl0aGVyIGxpY2Vuc2UuCi0gKgotICog
R1BMIExJQ0VOU0UgU1VNTUFSWQotICoKICAqIENvcHlyaWdodChjKSAyMDE2IEdvb2dsZSBJbmMu
IEFsbCByaWdodHMgcmVzZXJ2ZWQuCiAgKiBDb3B5cmlnaHQoYykgMjAxNiBMaW5hcm8gTHRkLiBB
bGwgcmlnaHRzIHJlc2VydmVkLgotICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdmVyc2lvbiAyIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcwot
ICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCi0gKgotICogVGhp
cyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2Vm
dWwsIGJ1dAotICogV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGll
ZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElD
VUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKLSAqIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVy
c2lvbiAyIGZvciBtb3JlIGRldGFpbHMuCi0gKgotICogQlNEIExJQ0VOU0UKLSAqCi0gKiBDb3B5
cmlnaHQoYykgMjAxNiBHb29nbGUgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgotICogQ29weXJp
Z2h0KGMpIDIwMTYgTGluYXJvIEx0ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KLSAqCi0gKiBSZWRp
c3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdp
dGhvdXQKLSAqIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9ucwotICogYXJlIG1ldDoKLSAqCi0gKiAgKiBSZWRpc3RyaWJ1dGlv
bnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAotICogICAg
bm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFp
bWVyLgotICogICogUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVwcm9kdWNl
IHRoZSBhYm92ZSBjb3B5cmlnaHQKLSAqICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlv
bnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbgotICogICAgdGhlIGRvY3VtZW50YXRp
b24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZQotICogICAgZGlzdHJp
YnV0aW9uLgotICogICogTmVpdGhlciB0aGUgbmFtZSBvZiBHb29nbGUgSW5jLiBvciBMaW5hcm8g
THRkLiBub3IgdGhlIG5hbWVzIG9mCi0gKiAgICBpdHMgY29udHJpYnV0b3JzIG1heSBiZSB1c2Vk
IHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cwotICogICAgZGVyaXZlZCBmcm9tIHRoaXMg
c29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuCi0gKiAgICBwZXJtaXNzaW9u
LgotICoKLSAqIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xE
RVJTIEFORCBDT05UUklCVVRPUlMKLSAqICJBUyBJUyIgQU5EIEFOWSBFWFBSRVNTIE9SIElNUExJ
RUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UCi0gKiBMSU1JVEVEIFRPLCBUSEUgSU1Q
TElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IKLSAqIEEg
UEFSVElDVUxBUiBQVVJQT1NFIEFSRSBESVNDTEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBHT09H
TEUgSU5DLiBPUgotICogTElOQVJPIExURC4gQkUgTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJ
UkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwKLSAqIEVYRU1QTEFSWSwgT1IgQ09OU0VRVUVOVElB
TCBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywKLSAqIFBST0NVUkVNRU5U
IE9GIFNVQlNUSVRVVEUgR09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLCBEQVRBLCBPUgot
ICogUFJPRklUUzsgT1IgQlVTSU5FU1MgSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQg
T04gQU5ZIFRIRU9SWQotICogT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJ
Q1QgTElBQklMSVRZLCBPUiBUT1JUCi0gKiAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJX
SVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UKLSAqIE9GIFRISVMgU09GVFdB
UkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAg
Ki8KIAogI2lmbmRlZiBfX0dSRVlCVVNfRklSTVdBUkVfVVNFUl9ICmRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaAppbmRleCA3ZDY0OWE3ZmM0YzkuLjVmMzRkMWVm
ZmI1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19wcm90b2Nv
bHMuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oCkBA
IC0xLDUzICsxLDcgQEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBC
U0QtMy1DbGF1c2UpICovCiAvKgotICogVGhpcyBmaWxlIGlzIHByb3ZpZGVkIHVuZGVyIGEgZHVh
bCBCU0QvR1BMdjIgbGljZW5zZS4gIFdoZW4gdXNpbmcgb3IKLSAqIHJlZGlzdHJpYnV0aW5nIHRo
aXMgZmlsZSwgeW91IG1heSBkbyBzbyB1bmRlciBlaXRoZXIgbGljZW5zZS4KLSAqCi0gKiBHUEwg
TElDRU5TRSBTVU1NQVJZCi0gKgogICogQ29weXJpZ2h0KGMpIDIwMTQgLSAyMDE1IEdvb2dsZSBJ
bmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCiAgKiBDb3B5cmlnaHQoYykgMjAxNCAtIDIwMTUgTGlu
YXJvIEx0ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogaXQg
dW5kZXIgdGhlIHRlcm1zIG9mIHZlcnNpb24gMiBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMKLSAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgot
ICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdp
bGwgYmUgdXNlZnVsLCBidXQKLSAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4g
dGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCi0gKiBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIHZlcnNpb24gMiBmb3IgbW9yZSBkZXRhaWxzLgotICoKLSAqIEJTRCBMSUNFTlNFCi0g
KgotICogQ29weXJpZ2h0KGMpIDIwMTQgLSAyMDE1IEdvb2dsZSBJbmMuIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCi0gKiBDb3B5cmlnaHQoYykgMjAxNCAtIDIwMTUgTGluYXJvIEx0ZC4gQWxsIHJpZ2h0
cyByZXNlcnZlZC4KLSAqCi0gKiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQg
YmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKLSAqIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1p
dHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucwotICogYXJlIG1ldDoK
LSAqCi0gKiAgKiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhl
IGFib3ZlIGNvcHlyaWdodAotICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBh
bmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgotICogICogUmVkaXN0cmlidXRpb25zIGluIGJp
bmFyeSBmb3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKLSAqICAgIG5vdGlj
ZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBp
bgotICogICAgdGhlIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRl
ZCB3aXRoIHRoZQotICogICAgZGlzdHJpYnV0aW9uLgotICogICogTmVpdGhlciB0aGUgbmFtZSBv
ZiBHb29nbGUgSW5jLiBvciBMaW5hcm8gTHRkLiBub3IgdGhlIG5hbWVzIG9mCi0gKiAgICBpdHMg
Y29udHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cwot
ICogICAgZGVyaXZlZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3
cml0dGVuCi0gKiAgICBwZXJtaXNzaW9uLgotICoKLSAqIFRISVMgU09GVFdBUkUgSVMgUFJPVklE
RUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMKLSAqICJBUyBJUyIg
QU5EIEFOWSBFWFBSRVNTIE9SIElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9U
Ci0gKiBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElU
WSBBTkQgRklUTkVTUyBGT1IKLSAqIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRSBESVNDTEFJTUVE
LiBJTiBOTyBFVkVOVCBTSEFMTCBHT09HTEUgSU5DLiBPUgotICogTElOQVJPIExURC4gQkUgTElB
QkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwKLSAqIEVY
RU1QTEFSWSwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1QgTElN
SVRFRCBUTywKLSAqIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMgT1IgU0VSVklDRVM7
IExPU1MgT0YgVVNFLCBEQVRBLCBPUgotICogUFJPRklUUzsgT1IgQlVTSU5FU1MgSU5URVJSVVBU
SU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWQotICogT0YgTElBQklMSVRZLCBX
SEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUCi0gKiAoSU5DTFVE
SU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRI
RSBVU0UKLSAqIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lC
SUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAgKi8KIAogI2lmbmRlZiBfX0dSRVlCVVNfUFJPVE9DT0xT
X0gKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rl
c3QuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwppbmRl
eCBjZWJjMWQ5MGExODAuLmJhNmY5MDVmMjZmYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwpAQCAtNCw4ICs0LDYgQEAKICAqCiAgKiBDb3B5cmln
aHQgMjAxNSBHb29nbGUgSW5jLgogICogQ29weXJpZ2h0IDIwMTUgTGluYXJvIEx0ZC4KLSAqCi0g
KiBQcm92aWRlZCB1bmRlciB0aGUgdGhyZWUgY2xhdXNlIEJTRCBsaWNlbnNlIGZvdW5kIGluIHRo
ZSBMSUNFTlNFIGZpbGUuCiAgKi8KICNpbmNsdWRlIDxlcnJuby5oPgogI2luY2x1ZGUgPGZjbnRs
Lmg+Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==

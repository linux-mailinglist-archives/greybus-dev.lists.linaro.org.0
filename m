Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9D09F4A5
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 23:00:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C6F660E2B
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 21:00:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 11BCB60E68; Tue, 27 Aug 2019 21:00:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DAC0616FC;
	Tue, 27 Aug 2019 21:00:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4868E60C38
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 20:59:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3D21C60E68; Tue, 27 Aug 2019 20:59:53 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by lists.linaro.org (Postfix) with ESMTPS id 9E3F860E2B
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 20:59:49 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z11so221377wrt.4
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 13:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jTWT9NH+cRtP9RbnuJ4gIRSqzgVacE3VGQ/0s2AHQOc=;
 b=sY/h6oUtfa6y2vAer0ort9gqAwt6mtrgEbg6OCz/kSP1yNyFfhs/E9z62KbMRpN7O7
 X4TLl0mA1RI7ZfxmhtZKgM/QqCL/XSxk8ktDPIUlbp+B0jdSMOUY7V7fpx53cGdt750+
 tucx0EjUGQSDKQ83oqV5MbNUWn+vHtvrSnNo5D6YCr5LY/42H12ka5wOkXTkPcNOe7Fk
 vaHh0FHyi7ZFeYvOC0zP87svIE2PbxRIazPk6dWvJvBgC9/Gn17nZfnYpE/T1wikVTrM
 e2eUeWw1AOji3kySzOpDsMDnlQU3a3aszBSE2LDG4TEv9racUCbJkTiSRGFHp5QyxMih
 s1xw==
X-Gm-Message-State: APjAAAVpNI0/IEegDmksx7zlCzjXRVJqecW42AkcbTPcWFO9kqL9QTgL
 pde03GOpTrdny4slK3QgFz0JU1G3
X-Google-Smtp-Source: APXvYqztMDWtJ3k2+NO+tD8kybKY9qWdDqe4CouhQt3sU01/wwgA1VQpyWWS1r1HQf9Tx3GSX3v/ng==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr209985wrq.6.1566939588640;
 Tue, 27 Aug 2019 13:59:48 -0700 (PDT)
Received: from arch-late.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id c15sm439058wrb.80.2019.08.27.13.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 13:59:47 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Aug 2019 21:59:17 +0100
Message-Id: <20190827205917.8308-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, kbuild test robot <lkp@intel.com>,
 Gao Xiang <hsiangkao@aol.com>, greybus-dev@lists.linaro.org,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH v2] staging: greybus: add missing includes
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

QmVmb3JlIG1vdmluZyBncmV5YnVzIGNvcmUgb3V0IG9mIHN0YWdpbmcgYW5kIG1vdmluZyBoZWFk
ZXIgZmlsZXMgdG8KaW5jbHVkZS9saW51eCBzb21lIGdyZXlidXMgaGVhZGVyIGZpbGVzIHdlcmUg
bWlzc2luZyB0aGUgbmVjZXNzYXJ5CmluY2x1ZGVzLiBUaGlzIHdvdWxkIHRyaWdnZXIgY29tcGls
YXRpb24gZmFpbGx1cmVzIHdpdGggc29tZSBleGFtcGxlCmVycm9ycyBsb2dnZWQgYmVsbG93IGZv
ciB3aXRoIENPTkZJR19LRVJORUxfSEVBREVSX1RFU1Q9eS4KClNvLCBhZGQgdGhlIG5lY2Vzc2Fy
eSBoZWFkZXJzIHRvIGNvbXBpbGUgY2xlYW4gYmVmb3JlIHJlbG9jYXRpbmcgdGhlCmhlYWRlciBm
aWxlcy4KCi4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MjM6NTA6IGVycm9yOiB1bmtub3du
IHR5cGUgbmFtZSAndTE2JwogIGludCAoKmNwb3J0X2Rpc2FibGUpKHN0cnVjdCBnYl9ob3N0X2Rl
dmljZSAqaGQsIHUxNiBjcG9ydF9pZCk7IF5+fgouL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5
YnVzX3Byb3RvY29scy5oOjEzMTQ6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdfX3U4Jwog
IF9fdTggZGF0YVswXTsKICBefn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MjQ6NTI6
IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2JwogIGludCAoKmNwb3J0X2Nvbm5lY3RlZCko
c3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+Ci4vaW5jbHVkZS9s
aW51eC9ncmV5YnVzL2hkLmg6MjU6NDg6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2Jwog
IGludCAoKmNwb3J0X2ZsdXNoKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRf
aWQpOyBefn4KLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyNjo1MTogZXJyb3I6IHVua25v
d24gdHlwZSBuYW1lICd1MTYnCiAgaW50ICgqY3BvcnRfc2h1dGRvd24pKHN0cnVjdCBnYl9ob3N0
X2RldmljZSAqaGQsIHUxNiBjcG9ydF9pZCwgXn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hk
Lmg6Mjc6NTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1OCcKdTggcGhhc2UsIHVuc2lnbmVk
IGludCB0aW1lb3V0KTsKICAgICBefgouL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI4OjUw
OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKICBpbnQgKCpjcG9ydF9xdWllc2NlKShz
dHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQsIF5+fgouL2luY2x1ZGUvbGlu
dXgvZ3JleWJ1cy9oZC5oOjI5OjU6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnc2l6ZV90Jwog
ICAgIHNpemVfdCBwZWVyX3NwYWNlLCB1bnNpZ25lZCBpbnQgdGltZW91dCk7CiAgICAgXn5+fn5+
Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6Mjk6NTogbm90ZTogJ3NpemVfdCcgaXMgZGVm
aW5lZCBpbiBoZWFkZXIgJzxzdGRkZWYuaD4nOyBkaWQgeW91IGZvcmdldCB0byAnI2luY2x1ZGUg
PHN0ZGRlZi5oPic/Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MToxOgorI2luY2x1ZGUg
PHN0ZGRlZi5oPgogLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KLi9pbmNs
dWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyOTo1OgogICAgIHNpemVfdCBwZWVyX3NwYWNlLCB1bnNp
Z25lZCBpbnQgdGltZW91dCk7CiAgICAgXn5+fn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hk
Lmg6MzA6NDg6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2JwogIGludCAoKmNwb3J0X2Ns
ZWFyKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQpOyBefn4KLi9pbmNs
dWRlL2xpbnV4L2dyZXlidXMvaGQuaDozMjo0OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1
MTYnCiAgaW50ICgqbWVzc2FnZV9zZW5kKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYg
ZGVzdF9jcG9ydF9pZCwgXn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MzM6MzI6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSAnZ2ZwX3QnCnN0cnVjdCBnYl9tZXNzYWdlICptZXNzYWdl
LCBnZnBfdCBnZnBfbWFzayk7IF5+fn5+Ci4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MzU6
NTU6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2JwogIGludCAoKmxhdGVuY3lfdGFnX2Vu
YWJsZSkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsKClJlcG9ydGVk
LWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmVwb3J0ZWQtYnk6IEdhbyBY
aWFuZyA8aHNpYW5na2FvQGFvbC5jb20+ClNpZ25lZC1vZmYtYnk6IFJ1aSBNaWd1ZWwgU2lsdmEg
PHJ1aS5zaWx2YUBsaW5hcm8ub3JnPgpBY2tlZC1ieTogQWxleCBFbGRlciA8ZWxkZXJAa2VybmVs
Lm9yZz4KLS0tCgp2MS0+djI6CmxrcEBpbnRlbDoKICAtIGFkZGVkIGdyZXlidXNfcHJvdG9jb2xz
LmggaW5jbHVkZSB0byBzdmMuaCBoZWFkZXIKQWxleCBFbGRlcjoKICAtIHJlbW92ZSBleHRyYSBs
aW5lIGluIG9wZXJhdGlvbi5oCgpMb29rcyBsaWtlIGxrcCBjYW4gbm93IGZpbmQgbWlzc2luZyBo
ZWFkZXJzIHRoYXQgd2UgY2FuIG5vdCA6KSwKaXQgbXVzdCBiZSB0aGUgY29uZmlnLiBidXQgaXQg
aXMgcmlnaHQuCgpHcmVnIHBsZWFzZSBub3RlIHRoZSBuZXcgaW5jbHVkZSBpbiBzdmMuaCBtYXkg
bmVlZCB0byBiZSBjaGFuZ2VkCndoZW4gbW92aW5nIGhlYWRlcnMgdG8gaW5jbHVkZS9saW51eAoK
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2J1bmRsZS5oICAgICAgICAgICAgfCAzICsrKwogZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvY29ubmVjdGlvbi5oICAgICAgICB8IDMgKysrCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmggICAgICAgICAgIHwgMyArKysKIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaCAgfCAzICsrKwogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaCB8IDIgKysKIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2hkLmggICAgICAgICAgICAgICAgfCAzICsrKwogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
aW50ZXJmYWNlLmggICAgICAgICB8IDMgKysrCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9tYW5p
ZmVzdC5oICAgICAgICAgIHwgMiArKwogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbW9kdWxlLmgg
ICAgICAgICAgICB8IDMgKysrCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9vcGVyYXRpb24uaCAg
ICAgICAgIHwgNCArKysrCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zdmMuaCAgICAgICAgICAg
ICAgIHwgNSArKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2J1bmRsZS5oIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYnVuZGxlLmgKaW5kZXggODczNGQyMDU1NjU3Li42OWZlNTYxMGJiNDIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2J1bmRsZS5oCisrKyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2J1bmRsZS5oCkBAIC05LDcgKzksMTAgQEAKICNpZm5kZWYgX19CVU5ETEVf
SAogI2RlZmluZSBfX0JVTkRMRV9ICiAKKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNs
dWRlIDxsaW51eC9saXN0Lmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgorI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+CiAKICNkZWZpbmUJQlVORExFX0lEX05PTkUJVThfTUFYCiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Nvbm5lY3Rpb24uaCBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2Nvbm5lY3Rpb24uaAppbmRleCA1Y2EzYmVmYzA2MzYuLmQ1OWI3ZmMx
ZGUzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY29ubmVjdGlvbi5oCisr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Nvbm5lY3Rpb24uaApAQCAtOSw4ICs5LDExIEBA
CiAjaWZuZGVmIF9fQ09OTkVDVElPTl9ICiAjZGVmaW5lIF9fQ09OTkVDVElPTl9ICiAKKyNpbmNs
dWRlIDxsaW51eC9iaXRzLmg+CiAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgogI2luY2x1ZGUgPGxp
bnV4L2tmaWZvLmg+CisjaW5jbHVkZSA8bGludXgva3JlZi5oPgorI2luY2x1ZGUgPGxpbnV4L3dv
cmtxdWV1ZS5oPgogCiAjZGVmaW5lIEdCX0NPTk5FQ1RJT05fRkxBR19DU0QJCUJJVCgwKQogI2Rl
ZmluZSBHQl9DT05ORUNUSU9OX0ZMQUdfTk9fRkxPV0NUUkwJQklUKDEpCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmggYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9jb250cm9sLmgKaW5kZXggM2EyOWVjMDVmNjMxLi4wZDRlMmVkMjBmZTQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NvbnRyb2wuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9jb250cm9sLmgKQEAgLTksNiArOSw5IEBACiAjaWZuZGVmIF9fQ09OVFJPTF9ICiAj
ZGVmaW5lIF9fQ09OVFJPTF9ICiAKKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KKyNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgorCiBzdHJ1Y3QgZ2JfY29udHJvbCB7CiAJc3RydWN0IGRldmljZSBk
ZXY7CiAJc3RydWN0IGdiX2ludGVyZmFjZSAqaW50ZjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaCBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2dyZXlidXNfbWFuaWZlc3QuaAppbmRleCAyY2VjNWNmN2E4NDYuLjFjYjYwYWY0ZmViZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19tYW5pZmVzdC5oCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaApAQCAtMTQsNiArMTQs
OSBAQAogI2lmbmRlZiBfX0dSRVlCVVNfTUFOSUZFU1RfSAogI2RlZmluZSBfX0dSRVlCVVNfTUFO
SUZFU1RfSAogCisjaW5jbHVkZSA8bGludXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+CisKIGVudW0gZ3JleWJ1c19kZXNjcmlwdG9yX3R5cGUgewogCUdSRVlCVVNfVFlQRV9JTlZB
TElECQk9IDB4MDAsCiAJR1JFWUJVU19UWVBFX0lOVEVSRkFDRQkJPSAweDAxLApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaCBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmgKaW5kZXggZGRjNzNmMTBlYjIyLi5l
ODgzZWRiNTBlZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNf
cHJvdG9jb2xzLmgKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19wcm90b2Nv
bHMuaApAQCAtNTMsNiArNTMsOCBAQAogI2lmbmRlZiBfX0dSRVlCVVNfUFJPVE9DT0xTX0gKICNk
ZWZpbmUgX19HUkVZQlVTX1BST1RPQ09MU19ICiAKKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgor
CiAvKiBGaXhlZCBJRHMgZm9yIGNvbnRyb2wvc3ZjIHByb3RvY29scyAqLwogCiAvKiBTVkMgc3dp
dGNoLXBvcnQgZGV2aWNlIGlkcyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvaGQuaCBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hkLmgKaW5kZXggNmNmMDI0YTIwYTU4
Li43YmU1YzA2NWU3YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hkLmgK
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGQuaApAQCAtOSw2ICs5LDkgQEAKICNpZm5k
ZWYgX19IRF9ICiAjZGVmaW5lIF9fSERfSAogCisjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cisj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4KKwogc3RydWN0IGdiX2hvc3RfZGV2aWNlOwogc3RydWN0
IGdiX21lc3NhZ2U7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2ludGVy
ZmFjZS5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaW50ZXJmYWNlLmgKaW5kZXggMWMwMGM1
YmIzZWM5Li5mNWFiOTM3MzQ4ZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2ludGVyZmFjZS5oCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2ludGVyZmFjZS5oCkBA
IC05LDYgKzksOSBAQAogI2lmbmRlZiBfX0lOVEVSRkFDRV9ICiAjZGVmaW5lIF9fSU5URVJGQUNF
X0gKIAorI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
CisKIGVudW0gZ2JfaW50ZXJmYWNlX3R5cGUgewogCUdCX0lOVEVSRkFDRV9UWVBFX0lOVkFMSUQg
PSAwLAogCUdCX0lOVEVSRkFDRV9UWVBFX1VOS05PV04sCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9tYW5pZmVzdC5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbWFuaWZl
c3QuaAppbmRleCBmM2M5NWEyNTU2MzEuLmIxMDFhZjRjMmM3MiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvbWFuaWZlc3QuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9tYW5pZmVzdC5oCkBAIC05LDYgKzksOCBAQAogI2lmbmRlZiBfX01BTklGRVNUX0gKICNkZWZp
bmUgX19NQU5JRkVTVF9ICiAKKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgorCiBzdHJ1Y3QgZ2Jf
aW50ZXJmYWNlOwogYm9vbCBnYl9tYW5pZmVzdF9wYXJzZShzdHJ1Y3QgZ2JfaW50ZXJmYWNlICpp
bnRmLCB2b2lkICpkYXRhLCBzaXplX3Qgc2l6ZSk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL21vZHVsZS5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbW9kdWxlLmgK
aW5kZXggYjFlYmNjNjYzNmRiLi43MjJjMzQ0YTNhNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL21vZHVsZS5oCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL21vZHVs
ZS5oCkBAIC05LDYgKzksOSBAQAogI2lmbmRlZiBfX01PRFVMRV9ICiAjZGVmaW5lIF9fTU9EVUxF
X0gKIAorI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
CisKIHN0cnVjdCBnYl9tb2R1bGUgewogCXN0cnVjdCBkZXZpY2UgZGV2OwogCXN0cnVjdCBnYl9o
b3N0X2RldmljZSAqaGQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9vcGVy
YXRpb24uaCBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL29wZXJhdGlvbi5oCmluZGV4IDQwYjdi
MDJmZmY4OC4uOTZjYjk5ZTg5MDM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9vcGVyYXRpb24uaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9vcGVyYXRpb24uaApA
QCAtMTAsNiArMTAsMTAgQEAKICNkZWZpbmUgX19PUEVSQVRJT05fSAogCiAjaW5jbHVkZSA8bGlu
dXgvY29tcGxldGlvbi5oPgorI2luY2x1ZGUgPGxpbnV4L2tyZWYuaD4KKyNpbmNsdWRlIDxsaW51
eC90aW1lci5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisjaW5jbHVkZSA8bGludXgvd29y
a3F1ZXVlLmg+CiAKIHN0cnVjdCBnYl9vcGVyYXRpb247CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3N2Yy5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3ZjLmgKaW5k
ZXggYWQwMTc4M2JhYzljLi41ZTQwMGUwYzI3YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3N2Yy5oCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3N2Yy5oCkBAIC05
LDYgKzksMTEgQEAKICNpZm5kZWYgX19TVkNfSAogI2RlZmluZSBfX1NWQ19ICiAKKyNpbmNsdWRl
IDxsaW51eC9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgorCisjaW5jbHVkZSAi
Z3JleWJ1c19wcm90b2NvbHMuaCIKKwogI2RlZmluZSBHQl9TVkNfQ1BPUlRfRkxBR19FMkVGQwkJ
QklUKDApCiAjZGVmaW5lIEdCX1NWQ19DUE9SVF9GTEFHX0NTRF9OCQlCSVQoMSkKICNkZWZpbmUg
R0JfU1ZDX0NQT1JUX0ZMQUdfQ1NWX04JCUJJVCgyKQotLSAKMi4yMi4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=

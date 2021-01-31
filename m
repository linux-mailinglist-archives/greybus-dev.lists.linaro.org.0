Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43630A0FA
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:55:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFF2A667A1
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:55:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8929D667A4; Mon,  1 Feb 2021 04:55:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E91F5667D5;
	Mon,  1 Feb 2021 04:52:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BA9E16600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:33:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AA73E66460; Sun, 31 Jan 2021 17:33:21 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id B41746600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:33:20 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c132so10440543pga.3
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kqzKgRXAJuYCJnf9qlqUQ95/4dPlUVexaDClNJu+4o=;
 b=YxrLe4kkKDIuvJMBlvLL+57ExpBNb6v4faonK7HHClgWb2CIgs7l3slrCRwzeDXP/6
 Pdmt7Ikvb6OrPc6i+az6+lcHCANCUQEWOX8SXeyzZn0jeTxmtYqfkSWPpNlbAbR3jQ/o
 EZWDTAHgmrYacODSU8FqL+lj8vipKm7xkSGaSBdhgP1vrxH0n4HyvXyrDeyBeb2n6BPj
 Ejyk8cCQXFjyLMnFGQxL+t5D+hb+62B2czlytBdvDHssdOMjslxYXWsQRta5oeCku17Z
 0o7Nd/+TPyp7dfsHblQKnO518uQg8A9k2f9IrNGUm1mgF6yorsoMyjvBEkI3x8eynHyA
 koGg==
X-Gm-Message-State: AOAM533J9/4SmvGYOOd78j1UZfYxYg4K5t3u6Msh7fBQMnIAR7DGMLS+
 l70z1mFoVzM7gTedd/p7rBY=
X-Google-Smtp-Source: ABdhPJys/KIIkqbArr3BBk6zxyfIuIi9uPQFd4sUr7ipe/WtqEH4D4K7cPU/+BVgCni/eif1aK0rvQ==
X-Received: by 2002:a62:774a:0:b029:1be:ca30:53ad with SMTP id
 s71-20020a62774a0000b02901beca3053admr12869186pfc.42.1612114399971; 
 Sun, 31 Jan 2021 09:33:19 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
 by smtp.gmail.com with ESMTPSA id 72sm14944814pfw.170.2021.01.31.09.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:33:19 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:34 +0530
Message-Id: <20210131172838.146706-14-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Marc Dietrich <marvin24@gmx.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, William Cohen <wcohen@redhat.com>,
 ac100@lists.launchpad.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: [greybus-dev] [PATCH 13/13] staging: wimax: Switch from strlcpy to
	strscpy
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

c3RybGNweSBpcyBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
ZGVwcmVjYXRlZC5yc3QsCmFuZCB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGRpZmZlcmVuY2Ugd2hl
biB0aGUgY2FsbGVyIGV4cGVjdHMgdHJ1bmNhdGlvbgood2hlbiBub3QgY2hlY2tpbmcgdGhlIHJl
dHVybiB2YWx1ZSkuIHN0cnNjcHkgaXMgcmVsYXRpdmVseSBiZXR0ZXIgYXMgaXQKYWxzbyBhdm9p
ZHMgc2Nhbm5pbmcgdGhlIHdob2xlIHNvdXJjZSBzdHJpbmcuCgpUaGlzIHNpbGVuY2VzIHRoZSBy
ZWxhdGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MgZnJvbToKNWRiZGIyZDg3YzI5ICgiY2hlY2twYXRj
aDogcHJlZmVyIHN0cnNjcHkgdG8gc3RybGNweSIpCgpTaWduZWQtb2ZmLWJ5OiBLdW1hciBLYXJ0
aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvd2lt
YXgvaTI0MDBtL25ldGRldi5jIHwgNiArKystLS0KIGRyaXZlcnMvc3RhZ2luZy93aW1heC9pMjQw
MG0vdXNiLmMgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy93aW1heC9pMjQwMG0v
bmV0ZGV2LmMgYi9kcml2ZXJzL3N0YWdpbmcvd2ltYXgvaTI0MDBtL25ldGRldi5jCmluZGV4IDgz
MzlkNjAwZS4uY2QwNmVhZjc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvd2ltYXgvaTI0
MDBtL25ldGRldi5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy93aW1heC9pMjQwMG0vbmV0ZGV2LmMK
QEAgLTU2MSwxMSArNTYxLDExIEBAIHN0YXRpYyB2b2lkIGkyNDAwbV9nZXRfZHJ2aW5mbyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmV0X2RldiwKIHsKIAlzdHJ1Y3QgaTI0MDBtICppMjQwMG0gPSBuZXRf
ZGV2X3RvX2kyNDAwbShuZXRfZGV2KTsKIAotCXN0cmxjcHkoaW5mby0+ZHJpdmVyLCBLQlVJTERf
TU9ETkFNRSwgc2l6ZW9mKGluZm8tPmRyaXZlcikpOwotCXN0cmxjcHkoaW5mby0+ZndfdmVyc2lv
biwgaTI0MDBtLT5md19uYW1lID8gOiAiIiwKKwlzdHJzY3B5KGluZm8tPmRyaXZlciwgS0JVSUxE
X01PRE5BTUUsIHNpemVvZihpbmZvLT5kcml2ZXIpKTsKKwlzdHJzY3B5KGluZm8tPmZ3X3ZlcnNp
b24sIGkyNDAwbS0+ZndfbmFtZSA/IDogIiIsCiAJCXNpemVvZihpbmZvLT5md192ZXJzaW9uKSk7
CiAJaWYgKG5ldF9kZXYtPmRldi5wYXJlbnQpCi0JCXN0cmxjcHkoaW5mby0+YnVzX2luZm8sIGRl
dl9uYW1lKG5ldF9kZXYtPmRldi5wYXJlbnQpLAorCQlzdHJzY3B5KGluZm8tPmJ1c19pbmZvLCBk
ZXZfbmFtZShuZXRfZGV2LT5kZXYucGFyZW50KSwKIAkJCXNpemVvZihpbmZvLT5idXNfaW5mbykp
OwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvd2ltYXgvaTI0MDBtL3VzYi5jIGIv
ZHJpdmVycy9zdGFnaW5nL3dpbWF4L2kyNDAwbS91c2IuYwppbmRleCBmMjUwZDAzY2UuLjQ4MWIx
Y2NkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3dpbWF4L2kyNDAwbS91c2IuYworKysg
Yi9kcml2ZXJzL3N0YWdpbmcvd2ltYXgvaTI0MDBtL3VzYi5jCkBAIC0zMzMsOCArMzMzLDggQEAg
c3RhdGljIHZvaWQgaTI0MDBtdV9nZXRfZHJ2aW5mbyhzdHJ1Y3QgbmV0X2RldmljZSAqbmV0X2Rl
diwKIAlzdHJ1Y3QgaTI0MDBtdSAqaTI0MDBtdSA9IGNvbnRhaW5lcl9vZihpMjQwMG0sIHN0cnVj
dCBpMjQwMG11LCBpMjQwMG0pOwogCXN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2ID0gaTI0MDBtdS0+
dXNiX2RldjsKIAotCXN0cmxjcHkoaW5mby0+ZHJpdmVyLCBLQlVJTERfTU9ETkFNRSwgc2l6ZW9m
KGluZm8tPmRyaXZlcikpOwotCXN0cmxjcHkoaW5mby0+ZndfdmVyc2lvbiwgaTI0MDBtLT5md19u
YW1lID8gOiAiIiwKKwlzdHJzY3B5KGluZm8tPmRyaXZlciwgS0JVSUxEX01PRE5BTUUsIHNpemVv
ZihpbmZvLT5kcml2ZXIpKTsKKwlzdHJzY3B5KGluZm8tPmZ3X3ZlcnNpb24sIGkyNDAwbS0+Zndf
bmFtZSA/IDogIiIsCiAJCXNpemVvZihpbmZvLT5md192ZXJzaW9uKSk7CiAJdXNiX21ha2VfcGF0
aCh1ZGV2LCBpbmZvLT5idXNfaW5mbywgc2l6ZW9mKGluZm8tPmJ1c19pbmZvKSk7CiB9Ci0tIAoy
LjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==

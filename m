Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBDB248563
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 14:53:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4B4E619B1
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 12:52:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9E08C65FD7; Tue, 18 Aug 2020 12:52:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9677A6162C;
	Tue, 18 Aug 2020 12:50:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1D7D760F4C
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 12:50:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0EB6360EFE; Tue, 18 Aug 2020 12:50:14 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by lists.linaro.org (Postfix) with ESMTPS id BE87760EFE
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 12:48:39 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id kr4so9369627pjb.2
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 05:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3wwF18SJPRWddTddR//I693SzjVDLp8OcZwkDYMGWI=;
 b=pfkQ1ioS6UrEMHSMOOMTBKiLbN3alCNJTw2pupFvXo7SW/QtIvqlkoihZNDJlkVeH0
 07zhvvwv9r0mzUAm5+Gqus/GUu8oy65T+t5cEU1eO4jBEqlTy2CyLX9GBtMtMDwTk2+s
 eVlfO2d6pafR8ot2ptZMsL/q1Ww+0+9h1vQA36ubl7E1UW8E4R95zVq+iZlXQGNwS7qm
 pzmHeontXs9Sx5EbpKdp5r+ktprW113AgYE+xwXzpB5+K7vxbBifmuGLOx7WZUD6fvGW
 EmyQnyCydmjgGxZYSoLyVTbxjLblougtdOk8Ui9CZESRgyFGPzuU78hqR6Om0QqEP/L5
 T9mQ==
X-Gm-Message-State: AOAM5304wQr7kJipKFuXl+1K4s2PVPNDYs5frzIy728KUs6lRVGdt+ye
 DPvoGicyet2SMj17rjkECYb1SZNYr0js8KQ=
X-Google-Smtp-Source: ABdhPJy018uHUmfKkM+8cajlBoJS6Y0FPrdtdoa8BE5MPQohtbpOf99zowCPtXJYGDFHdnm6EgSmWw==
X-Received: by 2002:a17:902:d345:: with SMTP id
 l5mr14325736plk.276.1597754918562; 
 Tue, 18 Aug 2020 05:48:38 -0700 (PDT)
Received: from localhost.localdomain ([116.68.79.111])
 by smtp.gmail.com with ESMTPSA id e4sm24264221pfd.204.2020.08.18.05.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 05:48:38 -0700 (PDT)
From: Vaishnav M A <vaishnav@beagleboard.org>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, arnd@arndb.de, johan@kernel.org,
 elder@kernel.org
Date: Tue, 18 Aug 2020 18:18:12 +0530
Message-Id: <20200818124815.11029-1-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, mchehab+huawei@kernel.org,
 robertcnelson@beagleboard.org, drew@beagleboard.org,
 Vaishnav M A <vaishnav@beagleboard.org>, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: [greybus-dev] [RFC PATCH v2 0/3] mikroBUS driver for add-on boards
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

SGksCgpUaGlzIFBhdGNoIHNlcmllcyBpcyBhbiB1cGRhdGUgdG8gdGhlIG1pa3JvQlVTIGRyaXZl
cgpSRkMgdjEgUGF0Y2ggOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC83LzI0LzUxOCAuClRo
ZSBtaWtyb2J1cyBkcml2ZXIgaXMgdXBkYXRlZCB0byBhZGQgbWlrcm9idXMgcG9ydHMgZnJvbSBk
ZXZpY2UtdHJlZQpvdmVybGF5cywgdGhlIGRlYnVnIGludGVyZmFjZXMgZm9yIGFkZGluZyBtaWty
b2J1cyBwb3J0cyB0aHJvdWdoIHN5c0ZTCmlzIHJlbW92ZWQsIGFuZCB0aGUgZHJpdmVyIGNvbnNp
ZGVycyB0aGUgZXh0ZW5kZWQgdXNhZ2Ugb2YgbWlrcm9idXMKcG9ydCBwaW5zIGZyb20gdGhlaXIg
c3RhbmRhcmQgcHVycG9zZXMuCgpjaGFuZ2UgbG9nOgogICAgICAgIHYyOiBzdXBwb3J0IGZvciBh
ZGRpbmcgbWlrcm9CVVMgcG9ydHMgZnJvbSBEVCBvdmVybGF5cywKICAgICAgICByZW1vdmUgZGVi
dWcgc3lzRlMgaW50ZXJmYWNlIGZvciBhZGRpbmcgbWlrcm9idXMgcG9ydHMsCiAgICAgICAgY29u
c2lkZXIgZXh0ZW5kZWQgcGluIHVzYWdlL2RldmlhdGlvbnMgZnJvbSBtaWtyb2J1cyBzdGFuZGFy
ZAogICAgICAgIHNwZWNpZmljYXRpb25zLAogICAgICAgIHVzZSBncmV5YnVzIENQb3J0IHByb3Rv
Y29sIGVudW0gaW5zdGVhZCBvZiBuZXcgcHJvdGNvbCBlbnVtcwogICAgICAgIEZpeCBjYXNlcyBv
ZiB3cm9uZyBpbmRlbmRhdGlvbiwgaWdub3JpbmcgcmV0dXJuIHZhbHVlcywgZnJlZWluZwogICAg
ICAgIGFsbG9jYXRlZCByZXNvdXJjZXMgaW4gY2FzZSBvZiBlcnJvcnMgYW5kIG90aGVyIHN0eWxl
IHN1Z2dlc3Rpb25zCiAgICAgICAgaW4gdjEgcmV2aWV3LgoKVmFpc2huYXYgTSBBICgzKToKICBh
ZGQgbWlrcm9idXMgZGVzY3JpcHRvcnMgdG8gZ3JleWJ1c19tYW5pZmVzdAogIG1pa3JvQlVTIGRy
aXZlciBmb3IgYWRkLW9uIGJvYXJkcyBvbiBtaWtyb2J1cyBwb3J0cwogIEFkZCBEZXZpY2UgVHJl
ZSBCaW5kaW5ncyBmb3IgbWlrcm9CVVMgcG9ydAoKIC4uLi9iaW5kaW5ncy9taXNjL2xpbnV4LG1p
a3JvYnVzLnR4dCAgICAgICAgICB8ICA4MSArKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMvbWlzYy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21pc2MvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9taXNjL21pa3JvYnVzL0tjb25maWcgICAg
ICAgICAgICAgICAgIHwgIDE2ICsKIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfY29yZS5j
ICAgICAgICAgfCA2OTIgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL21pc2MvbWlrcm9idXMv
bWlrcm9idXNfY29yZS5oICAgICAgICAgfCAxOTEgKysrKysKIGRyaXZlcnMvbWlzYy9taWtyb2J1
cy9taWtyb2J1c19tYW5pZmVzdC5jICAgICB8IDQ0NCArKysrKysrKysrKwogZHJpdmVycy9taXNj
L21pa3JvYnVzL21pa3JvYnVzX21hbmlmZXN0LmggICAgIHwgIDIxICsKIGRyaXZlcnMvbWlzYy9t
aWtyb2J1cy9taWtyb2J1c19wb3J0LmMgICAgICAgICB8IDE3MSArKysrKwogaW5jbHVkZS9saW51
eC9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaCAgICAgIHwgIDQ3ICsrCiAxMiBmaWxlcyBjaGFu
Z2VkLCAxNjc4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9saW51eCxtaWtyb2J1cy50eHQKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19jb3JlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfY29yZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX21hbmlmZXN0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFuaWZlc3QuaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19wb3J0LmMKCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==

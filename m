Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA11D6B50
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2020 19:17:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BAA65608DF
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2020 17:17:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id ABE066094E; Sun, 17 May 2020 17:17:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAD25608C3;
	Sun, 17 May 2020 17:17:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7A433607F9
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 17:17:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5BA2D60866; Sun, 17 May 2020 17:17:39 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id 11EF0607F9
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 17:17:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u35so3616485pgk.6
 for <greybus-dev@lists.linaro.org>; Sun, 17 May 2020 10:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=irZJO6pbVEj3U3ABtpGtJ2F3x8dJhV+kA+LvCOkLQAM=;
 b=c3CnJbhJQ5bO1npmcxoWuxpw5+DYIlgOVVFuk+YV/08RhmY+AeklrK7/21tFkpNd4v
 5dlffsT9WlJRvQJ3Hogj6QdlDHGgzvm6eMvOf5qHwJEj24iZAGcRmClChF1pqFRZPbui
 nFBjIk6p6JwA1d6Y/S+8S/jUvWoXOj0SkCiVngsIZMJ9rAsgCp0d6vEm9ChufwkHvhJQ
 nNSojFZVmHVUyW7hok9S+hD9FUR4WIcEELWZcqJ2guTPu4VXHhKzj4PaAMAQcyuRSrX2
 DzU4nd1byJxN0jfUQXilBCqo+hKOqgGGCZcPGdWh6YQFLv5ZvgeJYanVrhypWsWRK8nK
 uwOw==
X-Gm-Message-State: AOAM530nN5nuyaq4bzLi41qt4lDC3tAa3fDAUsdnjm3euea/ET3OZV+H
 BKiMRZZsAg0zOY6lipQQmRM=
X-Google-Smtp-Source: ABdhPJzDMqylgG25aUmEbtkKs3TZE0hUCFM05gws1ASXnZY92+suPYvDM/e5hNgUGz7wh+/sWDgzuQ==
X-Received: by 2002:a62:4e87:: with SMTP id
 c129mr13264991pfb.178.1589735856985; 
 Sun, 17 May 2020 10:17:36 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
 [192.55.54.38])
 by smtp.googlemail.com with ESMTPSA id n69sm6513900pjc.8.2020.05.17.10.17.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 May 2020 10:17:36 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Sun, 17 May 2020 22:47:15 +0530
Message-Id: <cover.1589734179.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH V1 0/6] Enable Greybus Audio codec driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

VGhlIGV4aXN0aW5nIEdCIEF1ZGlvIGNvZGVjIGRyaXZlciBpcyBkZXBlbmRlbnQgb24gTVNNODk5
NCBBdWRpbyBkcml2ZXIuCkR1cmluZyB0aGUgZGV2ZWxvcG1lbnQgc3RhZ2UsIHRoaXMgZGVwZGVu
Y3kgd2FzIGNvbmZpZ3VyZWQgZHVlIHRvCnZhcmlvdXMgY2hhbmdlcyBpbnZvbHZlZCBpbiBNU00g
QXVkaW8gZHJpdmVyIHRvIGVuYWJsZSBhZGR0aW9uYWwgY29kZWMKY2FyZCBhbmQgc29tZSBvZiB0
aGUgY2hhbmdlcyBwcm9wb3NlZCBpbiBtYWlubGluZSBBU29DIGZyYW1ld29yay4KSG93ZXZlciwg
dGhlc2UgYXJlIG5vdCB0aGUgcmVhbCBkZXBlbmRlbmNpZXMgYW5kIHNvbWUgb2YgdGhlbSBjYW4g
YmUKZWFzaWx5IHJlbW92ZWQuCgpUaGUgZm9sb3dpbmcgcGF0Y2ggc2VyaWVzIGluY2x1ZGVzIHRo
ZSBjaGFuZ2VzIHRvIHJlc29sdmUgdW5uZWNlc3NhcnkKZGVwZWRlbmNpZXMgYW5kIG1ha2UgdGhl
IGNvZGVjIGRyaXZlciBmdW5jdGlvbmFsIHdpdGggdGhlIGxhdGVzdCBrZXJuZWwuCgpQYXRjaCAx
LDI6IEluY3VkZXMgamFjayBmcmFtZXdvcmsgcmVsYXRlZCBjaGFuZ2VzLgpQYXRjaCAzLDQsNTog
UmVzb2x2ZXMgY29tcGlsYXRpb24gZXJyb3Igb2JzZXJ2ZWQgd2l0aCB0aGUgbGF0ZXN0IGtlcm5l
bCBhbmQKYWxzbyBwcm92aWRlcyBoZWxwZXIgQVBJcyByZXF1aXJlZCB0byBhbGxvdyBkeW5hbWlj
IGFkZGl0aW9uL3JlbW92YWwgb2YKbW9kdWxlcy4KUGF0Y2ggNjogRmluYWxseSBwcm92aWRlcyBj
b25maWcgb3B0aW9ucyBhbmQgcmVsYXRlZCBNYWtlZmlsZSBjaGFuZ2VzIHRvCmVuYWJsZSBHQiBD
b2RlYyBkcml2ZXIuCgpUaGFua3MgdG8gQWxleGFuZHJlIGZvciByYWlzaW5nIHRoZSBoZWFkc3Vw
IFsxXSBhbmQgbW90aXZhdGluZyBtZSB0byBwcm92aWRlCnRoZSBuZWNlc3NhcnkgY2hhbmdlcy4K
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwNTA3MjEyOTEyLjU5OTQzMy0x
LWFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tLwoKVmFpYmhhdiBBZ2Fyd2FsICg2KToKICBz
dGFnaW5nOiBncmV5YnVzOiBhdWRpbzogVXBkYXRlIHNuZF9qYWNrIEZXIHVzYWdlIGFzIHBlciBu
ZXcgQVBJcwogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBNYWludGFpbiBqYWNrIGxpc3Qgd2l0
aGluIEdCIEF1ZGlvIG1vZHVsZQogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBSZXNvbHZlIGNv
bXBpbGF0aW9uIGVycm9ycyBmb3IgR0IgY29kZWMKICAgIG1vZHVsZQogIHN0YWdpbmc6IGdyZXli
dXM6IGF1ZGlvOiBSZXNvbHZlIGNvbXBpbGF0aW9uIGVycm9yIGluIHRvcG9sb2d5IHBhcnNlcgog
IHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBBZGQgaGVscGVyIEFQSXMgZm9yIGR5bmFtaWMgYXVk
aW8gbW9kdWxlcwogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBFbmFibGUgR0IgY29kZWMsIGF1
ZGlvIG1vZHVsZSBjb21waWxhdGlvbi4KCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9LY29uZmln
ICAgICAgICAgIHwgIDE0ICsrLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUgICAg
ICAgICB8ICAgNiArLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyAgICB8
IDE4NyArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fY29kZWMuaCAgICB8ICAxMiArLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9faGVscGVyLmMgICB8IDE5NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuaCAgIHwgIDE3ICsrKwogZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fbW9kdWxlLmMgICB8ICAyMCArKy0tCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jIHwgMTMwICsrKysrKysrKystLS0tLS0tLS0tCiA4
IGZpbGVzIGNoYW5nZWQsIDQyNyBpbnNlcnRpb25zKCspLCAxNTYgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuaAoK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=

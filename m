Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2E1EB502
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 07:21:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B2DA261915
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 05:21:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9DF566192C; Tue,  2 Jun 2020 05:21:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 160A3618F6;
	Tue,  2 Jun 2020 05:21:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5C015618D3
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 05:21:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4EEEE618F4; Tue,  2 Jun 2020 05:21:38 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by lists.linaro.org (Postfix) with ESMTPS id 2E9B7618D3
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 05:21:37 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a4so4522897pfo.4
 for <greybus-dev@lists.linaro.org>; Mon, 01 Jun 2020 22:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kdz9W6x1z78WJYfw94insK8Fd4+Xm8e4ZRVXoKUzvSY=;
 b=h+SjDrf5Ysu06Zdgo538t4QPa6p1CpbENHjNzwA2AlTczOSSQIuMQ0cJQPwUpSH5fX
 aUbSlXYJDKTpSW4zrx8umzVeFfvDmpO6W1PvdpxjwauVkazfd97pPyxvPfY52dVbo0SI
 4F8vL8JwbJm53+GgSq5fiIUw7ow+fuy0m766oLD8/UuFLj8HHKJeh7d19tkLitfzbAUD
 3FhHO4+V8F4UiFy0wGTcbsRCDYxTL6XmfA/t7fAiWfOZLIa8OJRev8xIalOKZk1tHX1h
 ffldFSaeNcvACnC3QfTnhXmfiP9Q5H0HYeEE62y1sy0M6TNR7TM0j2DY8KlH0OULPmZA
 Q9Zg==
X-Gm-Message-State: AOAM533bxs+dwwD7bbjVOXhLhC3x1YURZBUaofzM4gf9pvqHbRx22nUg
 dYQLrFWVxx5PHefF2TGEcDI=
X-Google-Smtp-Source: ABdhPJzyy+fKy3+80OPPYMUOh8KsX3+BuN5V6lT7FHP1F8AKIMrKUKcYMuv0+jcSMkuxde+7Z2c9SQ==
X-Received: by 2002:a63:9319:: with SMTP id b25mr23287242pge.374.1591075296239; 
 Mon, 01 Jun 2020 22:21:36 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.21.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:21:35 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Tue,  2 Jun 2020 10:51:09 +0530
Message-Id: <cover.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [RESEND PATCH v1 0/6] Enable Greybus Audio codec
	driver
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

W1JFUVVFU1RdCgpUaGlzIHBhdGNoIHNlcmllcyBpbnRlbmRzIHRvICJFbmFibGUgR3JleWJ1cyBB
dWRpbyBjb2RlYyBkcml2ZXIiCmV4aXN0aW5nIGluIHRoZSBzdGFnaW5nIHRyZWUuIEkgaGF2ZSBz
aGFyZWQgdGhlIG9yaWdpbmFsIHBhdGNoIHNlcmllcyB3aXRoCkdyZXlidXMtRGV2IG1haWxpbmcg
bGlzdCBhbmQgYXMgcGVyIHRoZSBzdWdnZXN0aW9uIGZyb20gQWxleGFuZHJlLCBJJ20KYWxzbyBp
bnRlcmVzdGVkIHRvIHB1c2ggR3JleWJ1cyBBdWRpbyB0byBzb3VuZCBzb2MgdHJlZS4gVGh1cywg
bm93IEknbQpyZXNlbmRpbmcgaXQgdG8gQVNvYyBtYWludGFpbmVycyBmb3IgcmV2aWV3LgoKRm9s
bG93aW5nIGlzIHRoZSB0b3AgbGV2ZWwgU1cgZGVzaWduIGZvciBHQiBDb2RlYyBkcml2ZXIgYW5k
IEdCIEF1ZGlvCm1vZHVsZXMuCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICstLS0tLS0tLS0tLS0tLSsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICstLS0t
LS0tLS0tLS0tLT4rR0JBIE1vZHVsZSAxICB8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0tKwogICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKwogICAgfCAgICAgICAgICAgIHwgICAgICAgICAgfAogICAgfCAgICAgICAgICAgIHwgR3Jl
eWJ1cyAgfCAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLSsKICAgIHwgU05EIFNPQyAgICB8
IEF1ZGlvICAgICstLS0tLS0tLS0tLS0tLT4rR0JBIE1vZHVsZSAyICB8CiAgICB8IEZyYW1ld29y
ayAgfCBDb2RlYyAgICB8ICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0tKwogICAgfCAgICAg
ICAgICAgIHwgRHJpdmVyICAgfAogICAgfCAgICAgICAgICAgIHwgICAgICAgICAgfAogICAgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLSsKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLT4rR0JBIE1vZHVsZSBOICB8
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0t
LS0tKwoKUGF0Y2ggNSBjb250YWlucyB0aGUgY2hhbmdlcyB0byBwcm92aWRlIGhlbHBlciBBUElz
IHRvIGxpbmsgREFQTSBEQUkgd2lkZ2V0cwpmb3IgdGhlIG1vZHVsZSBhZGRlZCBhbmQgcmVtb3Zl
L2ZyZWUgY29tcG9uZW50IGNvbnRyb2xzIGZvciB0aGUgbW9kdWxlIHJlbW92ZWQKZHluYW1pY2Fs
bHkuIEV2ZW50dWFsbHksIEkgcHJvcG9zZSB0byBleHRlbmQgc25kX3NvY194eHggQVBJcyBmb3Ig
dGhpcwpwdXJwb3NlLgoKS2luZGx5IHNoYXJlIHlvdXIgaW5wdXRzLgoKW0NPVkVSIExFVFRFUl0K
ClRoZSBleGlzdGluZyBHQiBBdWRpbyBjb2RlYyBkcml2ZXIgaXMgZGVwZW5kZW50IG9uIE1TTTg5
OTQgQXVkaW8gZHJpdmVyLgpEdXJpbmcgdGhlIGRldmVsb3BtZW50IHN0YWdlLCB0aGlzIGRlcGRl
bmN5IHdhcyBjb25maWd1cmVkIGR1ZSB0bwp2YXJpb3VzIGNoYW5nZXMgaW52b2x2ZWQgaW4gTVNN
IEF1ZGlvIGRyaXZlciB0byBlbmFibGUgYWRkdGlvbmFsIGNvZGVjCmNhcmQgYW5kIHNvbWUgb2Yg
dGhlIGNoYW5nZXMgcHJvcG9zZWQgaW4gbWFpbmxpbmUgQVNvQyBmcmFtZXdvcmsuCkhvd2V2ZXIs
IHRoZXNlIGFyZSBub3QgdGhlIHJlYWwgZGVwZW5kZW5jaWVzIGFuZCBzb21lIG9mIHRoZW0gY2Fu
IGJlCmVhc2lseSByZW1vdmVkLgoKVGhlIGZvbG93aW5nIHBhdGNoIHNlcmllcyBpbmNsdWRlcyB0
aGUgY2hhbmdlcyB0byByZXNvbHZlIHVubmVjZXNzYXJ5CmRlcGVkZW5jaWVzIGFuZCBtYWtlIHRo
ZSBjb2RlYyBkcml2ZXIgZnVuY3Rpb25hbCB3aXRoIHRoZSBsYXRlc3Qga2VybmVsLgoKUGF0Y2gg
MSwyOiBJbmN1ZGVzIGphY2sgZnJhbWV3b3JrIHJlbGF0ZWQgY2hhbmdlcy4KUGF0Y2ggMyw0LDU6
IFJlc29sdmVzIGNvbXBpbGF0aW9uIGVycm9yIG9ic2VydmVkIHdpdGggdGhlIGxhdGVzdCBrZXJu
ZWwgYW5kCmFsc28gcHJvdmlkZXMgaGVscGVyIEFQSXMgcmVxdWlyZWQgdG8gYWxsb3cgZHluYW1p
YyBhZGRpdGlvbi9yZW1vdmFsIG9mCm1vZHVsZXMuClBhdGNoIDY6IEZpbmFsbHkgcHJvdmlkZXMg
Y29uZmlnIG9wdGlvbnMgYW5kIHJlbGF0ZWQgTWFrZWZpbGUgY2hhbmdlcyB0bwplbmFibGUgR0Ig
Q29kZWMgZHJpdmVyLgoKVGhhbmtzIHRvIEFsZXhhbmRyZSBmb3IgcmFpc2luZyB0aGUgaGVhZHN1
cCBbMV0gYW5kIG1vdGl2YXRpbmcgbWUgdG8gcHJvdmlkZQp0aGUgbmVjZXNzYXJ5IGNoYW5nZXMu
CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDUwNzIxMjkxMi41OTk0MzMt
MS1hbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbS8KCgpWYWliaGF2IEFnYXJ3YWwgKDYpOgog
IHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBVcGRhdGUgc25kX2phY2sgRlcgdXNhZ2UgYXMgcGVy
IG5ldyBBUElzCiAgc3RhZ2luZzogZ3JleWJ1czogYXVkaW86IE1haW50YWluIGphY2sgbGlzdCB3
aXRoaW4gR0IgQXVkaW8gbW9kdWxlCiAgc3RhZ2luZzogZ3JleWJ1czogYXVkaW86IFJlc29sdmUg
Y29tcGlsYXRpb24gZXJyb3JzIGZvciBHQiBjb2RlYwogICAgbW9kdWxlCiAgc3RhZ2luZzogZ3Jl
eWJ1czogYXVkaW86IFJlc29sdmUgY29tcGlsYXRpb24gZXJyb3IgaW4gdG9wb2xvZ3kgcGFyc2Vy
CiAgc3RhZ2luZzogZ3JleWJ1czogYXVkaW86IEFkZCBoZWxwZXIgQVBJcyBmb3IgZHluYW1pYyBh
dWRpbyBtb2R1bGVzCiAgc3RhZ2luZzogZ3JleWJ1czogYXVkaW86IEVuYWJsZSBHQiBjb2RlYywg
YXVkaW8gbW9kdWxlIGNvbXBpbGF0aW9uLgoKIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25m
aWcgICAgICAgICAgfCAgMTQgKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL01ha2VmaWxlICAg
ICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgICAg
fCAxODcgKysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5oICAgIHwgIDEyICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxw
ZXIuYyAgIHwgMTk3ICsrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19oZWxwZXIuaCAgIHwgIDE3ICsrCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb19tb2R1bGUuYyAgIHwgIDIwICstLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
dG9wb2xvZ3kuYyB8IDEzMCArKysrKysrLS0tLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgNDI3IGlu
c2VydGlvbnMoKyksIDE1NiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5oCgoKYmFzZS1jb21taXQ6IGFlNzNlNzc4
NDg3MWViZTJjNDNkYTYxOWI0YTFlMmM5ZmY4MTUwOGQKLS0gCjIuMjYuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

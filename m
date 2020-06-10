Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DAE1F5A5A
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 19:29:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A95961915
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2020 17:29:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0BDCF6198E; Wed, 10 Jun 2020 17:29:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E034B6197A;
	Wed, 10 Jun 2020 17:29:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8120161915
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:29:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 596CC61963; Wed, 10 Jun 2020 17:29:07 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id 2D87E61915
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 17:29:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u5so1275775pgn.5
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2020 10:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHuDWwcD46GsqYCnpIwOKdwPxiPdPtfeZ6O9l504PHI=;
 b=WJU0neB8ePGmJs3rjgaEa9eAkgMWwj4afV5DA//7UluEc1tpIJvS8HtJOxm13OgfXV
 QjkooxsAF5wvQREV8uR4/WZD279w7bhm7urOCtmkn03iyY2Z/bO4BukMmZ0MqA31+eB7
 crbJoU5cVfp3hW+yDJ3TlFs9vEL2mXsFmXSAdkm5e5lKMEK1hEytwo5xQ7X/h/QWBQFr
 rxnsQL6u+9BoxJMqLgLchskLSLVkuQbg7yu5S7LuLA1P6z+8iYNMaRiMngA0d1zuW7uY
 vLNgJqBz6n6U8rPHhTGRDGVY0GNj8+30Xqxhmgdb4WejKIJ/QST5FomykwdAddd6nkkF
 cNXQ==
X-Gm-Message-State: AOAM530QqmYCGdLO7CwGZRouJALhRSRcy9Gv77mJNG7o0RGNIbyLHq0R
 KKY67fl+NnwijIXswl+8Aik=
X-Google-Smtp-Source: ABdhPJxFC3aE1JPqfxE9yyHQOhKXlvby4i0EuVHpuVNTvbzQGF1PAL+ca8iz/SWsLtCNhFD4L8Xpww==
X-Received: by 2002:a65:6550:: with SMTP id a16mr3411032pgw.183.1591810145159; 
 Wed, 10 Jun 2020 10:29:05 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id l83sm490470pfd.150.2020.06.10.10.28.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 10:29:04 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 10 Jun 2020 22:58:24 +0530
Message-Id: <cover.1591802243.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v2 0/6] Enable Greybus Audio codec driver
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

VGhlIGV4aXN0aW5nIEdCIEF1ZGlvIGNvZGVjIGRyaXZlciBpcyBkZXBlbmRlbnQgb24gTVNNODk5
NCBBdWRpbyBkcml2ZXIuCkR1cmluZyB0aGUgZGV2ZWxvcG1lbnQgc3RhZ2UsIHRoaXMgZGVwZW5k
ZW5jeSB3YXMgY29uZmlndXJlZCBkdWUgdG8KdmFyaW91cyBjaGFuZ2VzIGludm9sdmVkIGluIE1T
TSBBdWRpbyBkcml2ZXIgdG8gZW5hYmxlIGFkZHRpb25hbCBjb2RlYwpjYXJkIGFuZCBzb21lIG9m
IHRoZSBjaGFuZ2VzIHByb3Bvc2VkIGluIG1haW5saW5lIEFTb0MgZnJhbWV3b3JrLgpIb3dldmVy
LCB0aGVzZSBhcmUgbm90IHRoZSByZWFsIGRlcGVuZGVuY2llcyBhbmQgc29tZSBvZiB0aGVtIGNh
biBiZQplYXNpbHkgcmVtb3ZlZC4KClRoZSBmb2xvd2luZyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMg
dGhlIGNoYW5nZXMgdG8gcmVzb2x2ZSB1bm5lY2Vzc2FyeQpkZXBlZGVuY2llcyBhbmQgbWFrZSB0
aGUgY29kZWMgZHJpdmVyIGZ1bmN0aW9uYWwgd2l0aCB0aGUgbGF0ZXN0IGtlcm5lbC4KClBhdGNo
IDEsMjogSW5jdWRlcyBqYWNrIGZyYW1ld29yayByZWxhdGVkIGNoYW5nZXMuClBhdGNoIDMsNCw1
OiBSZXNvbHZlcyBjb21waWxhdGlvbiBlcnJvciBvYnNlcnZlZCB3aXRoIHRoZSBsYXRlc3Qga2Vy
bmVsIGFuZAphbHNvIHByb3ZpZGVzIGhlbHBlciBBUElzIHJlcXVpcmVkIHRvIGFsbG93IGR5bmFt
aWMgYWRkaXRpb24vcmVtb3ZhbCBvZgptb2R1bGVzLgpQYXRjaCA2OiBGaW5hbGx5IHByb3ZpZGVz
IGNvbmZpZyBvcHRpb25zIGFuZCByZWxhdGVkIE1ha2VmaWxlIGNoYW5nZXMgdG8KZW5hYmxlIEdC
IENvZGVjIGRyaXZlci4KClRoYW5rcyB0byBBbGV4YW5kcmUgZm9yIHJhaXNpbmcgdGhlIGhlYWRz
dXAgWzFdIGFuZCBtb3RpdmF0aW5nIG1lIHRvIHByb3ZpZGUKdGhlIG5lY2Vzc2FyeSBjaGFuZ2Vz
LgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA1MDcyMTI5MTIuNTk5NDMz
LTEtYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20vCgpDaGFuZ2VzIGZyb20gdjEKLSBJbmNs
dWRlIHRoZSBjaGFuZ2VzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzIHN1Z2dlc3RlZCBieSBEYW4K
LSBSZWJhc2UgdG8gbGF0ZXN0IHN0YWdpbmctbmV4dAoKVmFpYmhhdiBBZ2Fyd2FsICg2KToKICBz
dGFnaW5nOiBncmV5YnVzOiBhdWRpbzogVXBkYXRlIHNuZF9qYWNrIEZXIHVzYWdlIGFzIHBlciBu
ZXcgQVBJcwogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBNYWludGFpbiBqYWNrIGxpc3Qgd2l0
aGluIEdCIEF1ZGlvIG1vZHVsZQogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBSZXNvbHZlIGNv
bXBpbGF0aW9uIGVycm9ycyBmb3IgR0IgY29kZWMKICAgIG1vZHVsZQogIHN0YWdpbmc6IGdyZXli
dXM6IGF1ZGlvOiBSZXNvbHZlIGNvbXBpbGF0aW9uIGVycm9yIGluIHRvcG9sb2d5IHBhcnNlcgog
IHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBBZGQgaGVscGVyIEFQSXMgZm9yIGR5bmFtaWMgYXVk
aW8gbW9kdWxlcwogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBFbmFibGUgR0IgY29kZWMsIGF1
ZGlvIG1vZHVsZSBjb21waWxhdGlvbi4KCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9LY29uZmln
ICAgICAgICAgIHwgIDE0ICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9NYWtlZmlsZSAgICAg
ICAgIHwgICA2ICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jICAgIHwg
MTc4ICsrKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19j
b2RlYy5oICAgIHwgIDEyICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIu
YyAgIHwgMTk3ICsrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19oZWxwZXIuaCAgIHwgIDE3ICsrCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19tb2R1bGUuYyAgIHwgIDE1ICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jIHwgMTI4ICsrKysrKystLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCA0MTIgaW5zZXJ0
aW9ucygrKSwgMTU1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmgKCgpiYXNlLWNvbW1pdDogYWY3YjQ4MDEwMzBj
MDc2Mzc4NDAxOTFjNjllYjY2NjkxN2U0MTM1ZAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QK
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=

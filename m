Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 53785219DB7
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2020 12:27:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 84EE766460
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2020 10:27:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7866E6606D; Thu,  9 Jul 2020 10:27:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B64316602F;
	Thu,  9 Jul 2020 10:27:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8ADD5608BA
 for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2020 10:27:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 70C476180F; Thu,  9 Jul 2020 10:27:41 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by lists.linaro.org (Postfix) with ESMTPS id 1E74C608BA
 for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2020 10:27:40 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j20so840335pfe.5
 for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2020 03:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjSXZR3FNSufIrtXfZE7yigmBZ+MTS6USGX6kAflGaU=;
 b=Qtq7u2qnJHWArZkpiN6CtflzBjueyH+49E5hC4xBHBfiuefdhjdQfnUBImSDK2VnzS
 GvDQ5k02K15EVhWM3L40QjdKm5rRVWpZ+yl53pR3NKVg6IyH4EjsIGCB8xtBLMiTgrwp
 A00+VW9c7glHXmOg3nzuwnNzeM1Y+FIMLAKUupipVBMGwEJDpV0LR8JkGJ1AS0AK7l9B
 eRa2zGTcXLYgtO3eMZs3KohgleyGs8YImAO0RKu8glPufvMHWjuseIZCiTuZXmObRA1I
 uwyVxjVkjlN17yzCRgiU8EN16cjjbk+aHhNDwrDp4J3oRjY3KhOuofAFU3ReRD4KTwkE
 1auw==
X-Gm-Message-State: AOAM533ngV2vtqtt+4hVWCSMIWNnPfh4tFSMZEwWhxbE3psYzbnjF+Z0
 3GimYLCAYbI3qeb/ECAco2PAuOWWZgJECw==
X-Google-Smtp-Source: ABdhPJwOttN/c6ZOvhQNZVKcz/AmmxLzPBN6yDPOrriaV1tLe9zVPrkbWS1mM0b5vE9md3mAamgjRQ==
X-Received: by 2002:a63:c50a:: with SMTP id f10mr54749296pgd.167.1594290459164; 
 Thu, 09 Jul 2020 03:27:39 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id y8sm2125163pju.49.2020.07.09.03.27.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:27:38 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Date: Thu,  9 Jul 2020 15:57:16 +0530
Message-Id: <cover.1594290158.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH v4 0/7] Enable Greybus Audio codec driver
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
LgoKVGhpcyBwYXRjaHNldCBpcyBpbnRlbmRlZCB0byByZXNvbHZlIHRoZSBjb21wb25lbnRpemF0
aW9uIGlzc3VlIG9ubHkuCkFuZCBhcyBwZXIgdGhlIHN1Z2dlc3Rpb24gWzJdIGZyb20gTWFyaywg
SSdsbCBzaGFyZSBhIHNlcGFyYXRlIHBhdGNoIHNlcmllcwphbGlnbmVkIHRvIEFTb0MgdHJlZS4g
T25jZSB0aGUgcmVsZXZhbnQgY2hhbmdlcyBhcmUgYWNjZXB0ZWQgaW4gc25kLXNvYwpmcmFtZXdv
cmssIEknbGwgc2hhcmUgcmVsZXZhbnQgcGF0Y2hlcyB0byBwdWxsIEdCIEF1ZGlvIG91dCBvZiB0
aGUKc3RhZ2luZyB0cmVlLgoKdjE6Ci0gSW5jbHVkZSB0aGUgY2hhbmdlcyBmb3IgdGhlIHJldmll
dyBjb21tZW50cyBzdWdnZXN0ZWQgYnkgRGFuCi0gUmViYXNlIHRvIGxhdGVzdCBzdGFnaW5nLW5l
eHQKCnYyOgotIEF2b2lkIGRlZmluaW5nIHVudXNlZCAndXBkYXRlJyBwb2ludGVyCi0gRml4IHRo
ZSBtaXNzaW5nIGNvbm5lY3QgYm9vbCB2YWx1ZSByZXF1aXJlZCBkdXJpbmcgbWl4ZXJfdXBkYXRl
X3Bvd2VyCi0gQWRkZWQgUmV2aWV3ZWQtYnkgdGFnIGZyb20gRGFuCi0gUmViYXNlIHRvIGxhdGVz
dCBzdGFnaW5nLW5leHQKCnYzOgotIEZpeCB0aGUgd2FybmluZ3MgcmVwb3J0ZWQgYnkgbGtwWzNd
Ci0gUmViYXNlIHRvIGxhdGVzdCBzdGFnaW5nLW5leHQKClsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjAwNTA3MjEyOTEyLjU5OTQzMy0xLWFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxzYS1kZXZlbC8yMDIwMDYxMjE2
MDYyMC5HSzUzOTZAc2lyZW5hLm9yZy51ay8KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvMjAyMDA2MjAwMTUwLm1OVmoxRHVxJTI1bGtwQGludGVsLmNvbS8KClZhaWJoYXYgQWdhcndh
bCAoNyk6CiAgc3RhZ2luZzogZ3JleWJ1czogYXVkaW86IFVwZGF0ZSBzbmRfamFjayBGVyB1c2Fn
ZSBhcyBwZXIgbmV3IEFQSXMKICBzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogTWFpbnRhaW4gamFj
ayBsaXN0IHdpdGhpbiBHQiBBdWRpbyBtb2R1bGUKICBzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzog
UmVzb2x2ZSBjb21waWxhdGlvbiBlcnJvcnMgZm9yIEdCIGNvZGVjCiAgICBtb2R1bGUKICBzdGFn
aW5nOiBncmV5YnVzOiBhdWRpbzogUmVzb2x2ZSBjb21waWxhdGlvbiBlcnJvciBpbiB0b3BvbG9n
eSBwYXJzZXIKICBzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogQWRkIGhlbHBlciBBUElzIGZvciBk
eW5hbWljIGF1ZGlvIG1vZHVsZXMKICBzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogRW5hYmxlIEdC
IGNvZGVjLCBhdWRpbyBtb2R1bGUgY29tcGlsYXRpb24uCiAgZHJpdmVyczogc3RhZ2luZzogYXVk
aW86IEZpeCB0aGUgbWlzc2luZyBoZWFkZXIgZmlsZSBmb3IgaGVscGVyIGZpbGUKCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9LY29uZmlnICAgICAgICAgIHwgIDE0ICstCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9NYWtlZmlsZSAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19jb2RlYy5jICAgIHwgMTc4ICsrKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5oICAgIHwgIDEyICstCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyAgIHwgMTk4ICsrKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuaCAgIHwgIDE3ICsrCiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYyAgIHwgIDE1ICstCiBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jIHwgMTMxICsrKysrKystLS0tLS0tLQogOCBm
aWxlcyBjaGFuZ2VkLCA0MTQgaW5zZXJ0aW9ucygrKSwgMTU3IGRlbGV0aW9ucygtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmgKCgpi
YXNlLWNvbW1pdDogMTQ0NDIxODFkMjA0OTA5NDVmMzQxNjQ0YmI4MjU3ZTMzNGIwMTQ0NwotLSAK
Mi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=

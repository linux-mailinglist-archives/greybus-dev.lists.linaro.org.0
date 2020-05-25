Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2C1E1CFE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:12:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B822E614FE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:12:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A8DB961805; Tue, 26 May 2020 08:12:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E06565F99;
	Tue, 26 May 2020 08:11:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0513D618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EA11061943; Mon, 25 May 2020 18:26:12 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by lists.linaro.org (Postfix) with ESMTPS id B62BC618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:11 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id nr22so4984576ejb.6
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qikXNcYuPEp2SbYrhq3PIeLmdf37Vp6toU2hryNiAU=;
 b=aZjuYFYYZIs4bnKwB18PJq5JPZemOJiQ6t2k+ttad8FwSlAhXUj1MQXPsCSXuSvoLe
 +pkVipZKewGvrbUSjGK0R1SLdfIO4Q5H58Kolv2AksI3seoqQBnDF7DqB3ts9M258UPi
 BN6SR3XSmxEUy5jZFsTUFCM6coe/dlIiu1txD/mQi2WKybeop/jrwIaKCUaB8P5AQBQi
 dO1RjeCXbTwH1+SX843xDBS+UdoEPQW/0bvyMFcXNvwuL5HMe22AL6ijsJfqQrk0n4Wr
 0as7elKOFjNQ6Gig3bvBOgXr4M29dzO7bcOi172g4T1QkHPboPa41+Nf6ltvwf+zgC4m
 dzYw==
X-Gm-Message-State: AOAM531hKUCzV+BHw7a9e5VEbbKVKD5UX5eSIYwcgTDYbj3ciU0L2xF6
 v8R9NjjAfFovvYqEfgrfjbA=
X-Google-Smtp-Source: ABdhPJxkEBfJS/XXtSSCnmQUkO84UroYhCAKuA4jbTqreWDo9ErA8dsQuCsf23LSLacMkksSHFqFeg==
X-Received: by 2002:a17:906:4bc1:: with SMTP id
 x1mr19051208ejv.13.1590431170704; 
 Mon, 25 May 2020 11:26:10 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:09 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:00 +0000
Message-Id: <20200525182608.1823735-1-kw@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 26 May 2020 08:10:58 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: [greybus-dev] [PATCH 0/8] Add helper for accessing Power Management
	callbacs
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

VGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYSBuZXcgZHJpdmVyX3RvX3BtKCkgaGVscGVyIGFsbG93
aW5nIGZvcgphY2Nlc3NpbmcgdGhlIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhY3MgZm9yIGEgcGFy
dGljdWxhciBkZXZpY2UuCgpBY2Nlc3MgdG8gdGhlIGNhbGxiYWNzIChzdHJ1Y3QgZGV2X3BtX29w
cykgaXMgbm9ybWFsbHkgZG9uZSB0aHJvdWdoCnVzaW5nIHRoZSBwbSBwb2ludGVyIHRoYXQgaXMg
ZW1iZWRkZWQgd2l0aGluIHRoZSBkZXZpY2VfZHJpdmVyIHN0cnVjdC4KClRoaXMgbmV3IGhlbHBl
ciBhbGxvd3MgZm9yIHRoZSBjb2RlIHJlcXVpcmVkIHRvIHJlZmVyZW5jZSB0aGUgcG0gcG9pbnRl
cgphbmQgYWNjZXNzIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhcyB0byBiZSBzaW1wbGlmaWVkLiAg
Q2hhbmdpbmcgdGhlCmZvbGxvd2luZzoKCiAgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydiA9IGRl
di0+ZHJpdmVyOwogIGlmIChkZXYtPmRyaXZlciAmJiBkZXYtPmRyaXZlci0+cG0gJiYgZGV2LT5k
cml2ZXItPnBtLT5wcmVwYXJlKSB7CiAgICAgIGludCByZXQgPSBkZXYtPmRyaXZlci0+cG0tPnBy
ZXBhcmUoZGV2KTsKClRvOgoKICBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0gPSBkcml2ZXJf
dG9fcG0oZGV2LT5kcml2ZXIpOwogIGlmIChwbSAmJiBwbS0+cHJlcGFyZSkgewogICAgICBpbnQg
cmV0ID0gcG0tPnByZXBhcmUoZGV2KTsKCk9yLCBjaGFuZ2luZyB0aGUgZm9sbG93aW5nOgoKICAg
ICBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0gPSBkZXYtPmRyaXZlciA/IGRldi0+ZHJpdmVy
LT5wbSA6IE5VTEw7CgpUbzoKICAgICBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0gPSBkcml2
ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOwoKVGhpcyBzZXJpZXMgYnVpbGRzIG9uIHRvcCBvZiB0aGUg
cHJldmlvdXMgY29tbWl0IDZkYTJmMmNjZmQyZCAoIlBDSS9QTToKTWFrZSBwb3dlciBtYW5hZ2Vt
ZW50IG9wIGNvZGluZyBzdHlsZSBjb25zaXN0ZW50IikgdGhhdCBoYWQgYW4gYWltIHRvCm1ha2Ug
YWNjZXNzaW5nIHRoZSBQb3dlciBNYW5hZ2VtbmV0IGNhbGxiYWNzIG1vcmUgY29uc2lzdGVudC4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKTGlua3M6CiAgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvZHJpdmVyZGV2LWRldmVsLzIwMTkxMDE0MjMwMDE2LjI0MDkxMi02LWhlbGdhYXNA
a2VybmVsLm9yZy8KICBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcml2ZXJkZXYtZGV2ZWwvODU5
MjMwMi5yNHhDNlJJeTY5QGtyZWFjaGVyLwogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaXZl
cmRldi1kZXZlbC8yMDE5MTAxNjEzNTAwMi5HQTI0Njc4QGthZGFtLwoKS3J6eXN6dG9mIFdpbGN6
ecWEc2tpICg4KToKICBkcml2ZXIgY29yZTogQWRkIGhlbHBlciBmb3IgYWNjZXNzaW5nIFBvd2Vy
IE1hbmFnZW1lbnQgY2FsbGJhY3MKICBBQ1BJOiBQTTogVXNlIHRoZSBuZXcgZGV2aWNlX3RvX3Bt
KCkgaGVscGVyIHRvIGFjY2VzcyBzdHJ1Y3QKICAgIGRldl9wbV9vcHMKICBncmV5YnVzOiBVc2Ug
dGhlIG5ldyBkZXZpY2VfdG9fcG0oKSBoZWxwZXIgdG8gYWNjZXNzIHN0cnVjdCBkZXZfcG1fb3Bz
CiAgc2NzaTogcG06IFVzZSB0aGUgbmV3IGRldmljZV90b19wbSgpIGhlbHBlciB0byBhY2Nlc3Mg
c3RydWN0CiAgICBkZXZfcG1fb3BzCiAgdXNiOiBwaHk6IGZzbDogVXNlIHRoZSBuZXcgZGV2aWNl
X3RvX3BtKCkgaGVscGVyIHRvIGFjY2VzcyBzdHJ1Y3QKICAgIGRldl9wbV9vcHMKICBQQ0kvUE06
IFVzZSB0aGUgbmV3IGRldmljZV90b19wbSgpIGhlbHBlciB0byBhY2Nlc3Mgc3RydWN0IGRldl9w
bV9vcHMKICBQTTogVXNlIHRoZSBuZXcgZGV2aWNlX3RvX3BtKCkgaGVscGVyIHRvIGFjY2VzcyBz
dHJ1Y3QgZGV2X3BtX29wcwogIG5ldC9pdWN2OiBVc2UgdGhlIG5ldyBkZXZpY2VfdG9fcG0oKSBo
ZWxwZXIgdG8gYWNjZXNzIHN0cnVjdAogICAgZGV2X3BtX29wcwoKIGRyaXZlcnMvYWNwaS9kZXZp
Y2VfcG0uYyAgICAgICAgIHwgIDUgKystCiBkcml2ZXJzL2Jhc2UvcG93ZXIvZG9tYWluLmMgICAg
ICB8IDEyICsrKystLQogZHJpdmVycy9iYXNlL3Bvd2VyL2dlbmVyaWNfb3BzLmMgfCA2NSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9iYXNlL3Bvd2VyL21haW4uYyAg
ICAgICAgfCA0OCArKysrKysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9iYXNlL3Bvd2VyL3J1
bnRpbWUuYyAgICAgfCAgNyArKy0tCiBkcml2ZXJzL2dyZXlidXMvYnVuZGxlLmMgICAgICAgICB8
ICA0ICstCiBkcml2ZXJzL3BjaS9wY2ktZHJpdmVyLmMgICAgICAgICB8IDMyICsrKysrKysrLS0t
LS0tLS0KIGRyaXZlcnMvc2NzaS9zY3NpX3BtLmMgICAgICAgICAgIHwgIDggKystLQogZHJpdmVy
cy91c2IvcGh5L3BoeS1mc2wtdXNiLmMgICAgfCAxMSArKysrLS0KIGluY2x1ZGUvbGludXgvZGV2
aWNlL2RyaXZlci5oICAgIHwgMTUgKysrKysrKysKIG5ldC9pdWN2L2l1Y3YuYyAgICAgICAgICAg
ICAgICAgIHwgMzAgKysrKysrKysrLS0tLS0tCiAxMSBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0
aW9ucygrKSwgOTkgZGVsZXRpb25zKC0pCgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=

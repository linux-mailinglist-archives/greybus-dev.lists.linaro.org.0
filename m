Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E930A0ED
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 05:53:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1C23C667CF
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Feb 2021 04:53:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F0AC6667D9; Mon,  1 Feb 2021 04:53:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D206F6679C;
	Mon,  1 Feb 2021 04:52:48 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 591566600D
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:30:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 48D7766753; Sun, 31 Jan 2021 17:30:56 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by lists.linaro.org (Postfix) with ESMTPS id 5E27666067
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 17:30:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b145so3215594pfb.4
 for <greybus-dev@lists.linaro.org>; Sun, 31 Jan 2021 09:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5wzP23ErPEWymRBo16kOdWR6OMTJk3Dg5mRlDwF45M=;
 b=EWUOxpTIPnht5oX/dZlljf3GF6voZ0t+cxib4qQUuctut08EtDOcrtr44uuHuUVpOH
 xuIG/JAXDmWXoUR30wEL8P8BjQ8rzUUV+3JReuaLEmGn562U9mkNkGl3i154m0AoQDwi
 TmCU+hG8sOWpGT6PDrwCUR3DgT63ZUCcQKTgSFFtbvOFaKZv3KO5lWWZeTxvmmALdbHa
 9+1O+x9dz9G5sC2saP+tkXbuHz3psEGHX8ew3H5Y8l4kd+Au8n7KtD/x+ynjtv4nOV77
 Gfu9sPtFKCimmeikY5Rc0amW59MEDA2mH1aUal8xpC2RXv+4SJT/+AG3ficcDBALUKxl
 bDcw==
X-Gm-Message-State: AOAM531K6qJYyXKNdsTIV54CB47lJ1RQe67W68EG8KtFXLwIycFvyezG
 ToyZYhiQbP7BSgJHymRPrKs=
X-Google-Smtp-Source: ABdhPJxqAvDMo/qrnNX2hVoJHZiC2bLwNfcChMrdrFwGXf+D/Pv16veh3L2vYHbiTMOhsalbhu1+dg==
X-Received: by 2002:a63:ec09:: with SMTP id j9mr4194282pgh.179.1612114252401; 
 Sun, 31 Jan 2021 09:30:52 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:19dc:4c7b:99d8:200e])
 by smtp.gmail.com with ESMTPSA id w7sm4751206pjv.24.2021.01.31.09.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 09:30:51 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Sun, 31 Jan 2021 22:58:21 +0530
Message-Id: <20210131172838.146706-1-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:52:47 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Marc Dietrich <marvin24@gmx.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 ac100@lists.launchpad.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Robert Richter <rric@kernel.org>, Johan Hovold <johan@kernel.org>,
 Ian Abbott <abbotti@mev.co.uk>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 linux-tegra@vger.kernel.org, William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: [greybus-dev] [PATCH 00/13] Convert all users of strlcpy to strscpy
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

VGhpcyBzZXJpZXMgY29udmVydHMgYWxsIGV4aXN0aW5nIHVzZXJzIG9mIHN0cmxjcHkgaW4gZHJp
dmVycy9zdGFnaW5nIHRvIHVzZQpzdHJzY3B5IGluc3RlYWQuCgpzdHJsY3B5IGlzIG1hcmtlZCBh
cyBkZXByZWNhdGVkIGluIERvY3VtZW50YXRpb24vcHJvY2Vzcy9kZXByZWNhdGVkLnJzdCwgYW5k
CnRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgZGlmZmVyZW5jZSB3aGVuIHRoZSBjYWxsZXIgZXhwZWN0
cyB0cnVuY2F0aW9uICh3aGVuIG5vdApjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlKS4gc3Ryc2Nw
eSBpcyByZWxhdGl2ZWx5IGJldHRlciBhcyBpdCBhbHNvIGF2b2lkcwpzY2FubmluZyB0aGUgd2hv
bGUgc291cmNlIHN0cmluZy4KClRoaXMgc2lsZW5jZXMgdGhlIHJlbGF0ZWQgY2hlY2twYXRjaCB3
YXJuaW5ncyBmcm9tOgo1ZGJkYjJkODdjMjkgKCJjaGVja3BhdGNoOiBwcmVmZXIgc3Ryc2NweSB0
byBzdHJsY3B5IikKClRoZSBjb252ZXJzaW9ucyB3ZXJlIHBlcmZvcm1lZCBpbiB0d28gc3RlcHM6
CgoxLiBUaGUgZm9sbG93aW5nIGNvY2NpbmVsbGUgc2NyaXB0IHdhcyB1c2VkIHRvIGlkZW50aWZ5
IGFuZCByZXBsYWNlIGNhbGwgc2l0ZXMKdGhhdCBleHBlY3QgdHJ1bmNhdGlvbi4KCiQgc3BhdGNo
IC0tc3AtZmlsZSBzdHJzY3B5LmNvY2NpIC0taW5jbHVkZS1oZWFkZXJzIC0tZGlyIC0taW4tcGxh
Y2UgZHJpdmVycy9zdGFnaW5nCgpAc3Ryc2NweUAKZXhwcmVzc2lvbiBkZXN0LCBzcmMsIHNpemU7
CkBACi1zdHJsY3B5KGRlc3QsIHNyYywgc2l6ZSk7CitzdHJzY3B5KGRlc3QsIHNyYywgc2l6ZSk7
CgoyLiBFYWNoIGluZGl2aWR1YWwgYXV0b21hdGVkIGNvbnZlcnNpb24gd2FzIHJlY2hlY2tlZCBt
YW51YWxseSBmb3IgY29ycmVjdG5lc3MuCgpLdW1hciBLYXJ0aWtleWEgRHdpdmVkaSAoMTMpOgog
IHN0YWdpbmc6IGNvbWVkaTogU3dpdGNoIGZyb20gc3RybGNweSB0byBzdHJzY3B5CiAgc3RhZ2lu
ZzogZ3JleWJ1czogU3dpdGNoIGZyb20gc3RybGNweSB0byBzdHJzY3B5CiAgc3RhZ2luZzogZnNs
LWRwYWEyOiBTd2l0Y2ggZnJvbSBzdHJsY3B5IHRvIHN0cnNjcHkKICBzdGFnaW5nOiBtb3N0OiBT
d2l0Y2ggZnJvbSBzdHJsY3B5IHRvIHN0cnNjcHkKICBzdGFnaW5nOiBudmVjOiBTd2l0Y2ggZnJv
bSBzdHJsY3B5IHRvIHN0cnNjcHkKICBzdGFnaW5nOiBvY3Rlb246IFN3aXRjaCBmcm9tIHN0cmxj
cHkgdG8gc3Ryc2NweQogIHN0YWdpbmc6IG9scGNfZGNvbjogU3dpdGNoIGZyb20gc3RybGNweSB0
byBzdHJzY3B5CiAgc3RhZ2luZzogcnRsODE4OGV1OiBTd2l0Y2ggZnJvbSBzdHJsY3B5IHRvIHN0
cnNjcHkKICBzdGFnaW5nOiBydGw4MTkyZTogU3dpdGNoIGZyb20gc3RybGNweSB0byBzdHJzY3B5
CiAgc3RhZ2luZzogcnRsODE5MnU6IFN3aXRjaCBmcm9tIHN0cmxjcHkgdG8gc3Ryc2NweQogIHN0
YWdpbmc6IHJ0bDg3MTI6IFN3aXRjaCBmcm9tIHN0cmxjcHkgdG8gc3Ryc2NweQogIHN0YWdpbmc6
IHNtNzUwZmI6IFN3aXRjaCBmcm9tIHN0cmxjcHkgdG8gc3Ryc2NweQogIHN0YWdpbmc6IHdpbWF4
OiBTd2l0Y2ggZnJvbSBzdHJsY3B5IHRvIHN0cnNjcHkKCiBkcml2ZXJzL3N0YWdpbmcvY29tZWRp
L2NvbWVkaV9mb3BzLmMgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvc3Rh
Z2luZy9mc2wtZHBhYTIvZXRoc3cvZXRoc3ctZXRodG9vbC5jICAgICAgICAgICB8IDYgKysrLS0t
CiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYyAgICAgICAg
ICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9n
eS5jICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
cG93ZXJfc3VwcGx5LmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvc3BpbGliLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2
ZXJzL3N0YWdpbmcvbW9zdC9zb3VuZC9zb3VuZC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCiBkcml2ZXJzL3N0YWdpbmcvbW9zdC92aWRlby92aWRlby5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9zdGFnaW5nL252ZWMvbnZlY19wczIuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3N0YWdpbmcvb2N0ZW9uL2V0aGVy
bmV0LW1kaW8uYyAgICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9zdGFnaW5n
L29scGNfZGNvbi9vbHBjX2Rjb24uYyAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVy
cy9zdGFnaW5nL3J0bDgxODhldS9vc19kZXAvaW9jdGxfbGludXguYyAgICAgICAgICAgIHwgMiAr
LQogZHJpdmVycy9zdGFnaW5nL3J0bDgxOTJlL3J0bDgxOTJlL3J0bF9ldGh0b29sLmMgICAgICAg
ICAgIHwgNiArKystLS0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4MTkydS9pZWVlODAyMTEvaWVlZTgw
MjExX3NvZnRtYWNfd3guYyB8IDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzEyL3J0bDg3MXhf
aW9jdGxfbGludXguYyAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9zbTc1MGZi
L3NtNzUwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvc3RhZ2lu
Zy93aW1heC9pMjQwMG0vbmV0ZGV2LmMgICAgICAgICAgICAgICAgICAgICB8IDYgKysrLS0tCiBk
cml2ZXJzL3N0YWdpbmcvd2ltYXgvaTI0MDBtL3VzYi5jICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICsrLS0KIDE5IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9u
cygtKQoKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK

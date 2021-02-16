Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC34322759
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Feb 2021 10:01:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D815C615AF
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Feb 2021 09:01:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C721B667D4; Tue, 23 Feb 2021 09:01:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 819D16651C;
	Tue, 23 Feb 2021 09:01:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AEA7F6062F
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 14:36:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 92B1461887; Tue, 16 Feb 2021 14:36:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id A95AD6062F
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 14:36:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8E9064DF5;
 Tue, 16 Feb 2021 14:36:27 +0000 (UTC)
Date: Tue, 16 Feb 2021 15:36:24 +0100
From: Robert Richter <rric@kernel.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Message-ID: <YCvYaGSPg4HGnCqC@rric.localdomain>
References: <20210131172838.146706-1-memxor@gmail.com>
 <20210131172838.146706-7-memxor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210131172838.146706-7-memxor@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 23 Feb 2021 09:01:31 +0000
Cc: linux-fbdev@vger.kernel.org, Jon Nettleton <jon.nettleton@gmail.com>,
 Marc Dietrich <marvin24@gmx.de>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>, ac100@lists.launchpad.net,
 devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>,
 Jens Frederich <jfrederich@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Ian Abbott <abbotti@mev.co.uk>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-tegra@vger.kernel.org,
 William Cohen <wcohen@redhat.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Alex Elder <elder@kernel.org>, Teddy Wang <teddy.wang@siliconmotion.com>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [greybus-dev] [PATCH 06/13] staging: octeon: Switch from
	strlcpy to strscpy
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

T24gMzEuMDEuMjEgMjI6NTg6MjcsIEt1bWFyIEthcnRpa2V5YSBEd2l2ZWRpIHdyb3RlOgo+IHN0
cmxjcHkgaXMgbWFya2VkIGFzIGRlcHJlY2F0ZWQgaW4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2Rl
cHJlY2F0ZWQucnN0LAo+IGFuZCB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGRpZmZlcmVuY2Ugd2hl
biB0aGUgY2FsbGVyIGV4cGVjdHMgdHJ1bmNhdGlvbgo+ICh3aGVuIG5vdCBjaGVja2luZyB0aGUg
cmV0dXJuIHZhbHVlKS4gc3Ryc2NweSBpcyByZWxhdGl2ZWx5IGJldHRlciBhcyBpdAo+IGFsc28g
YXZvaWRzIHNjYW5uaW5nIHRoZSB3aG9sZSBzb3VyY2Ugc3RyaW5nLgo+IAo+IFRoaXMgc2lsZW5j
ZXMgdGhlIHJlbGF0ZWQgY2hlY2twYXRjaCB3YXJuaW5ncyBmcm9tOgo+IDVkYmRiMmQ4N2MyOSAo
ImNoZWNrcGF0Y2g6IHByZWZlciBzdHJzY3B5IHRvIHN0cmxjcHkiKQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEt1bWFyIEthcnRpa2V5YSBEd2l2ZWRpIDxtZW14b3JAZ21haWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL3N0YWdpbmcvb2N0ZW9uL2V0aGVybmV0LW1kaW8uYyB8IDYgKysrLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTog
Um9iZXJ0IFJpY2h0ZXIgPHJyaWNAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK

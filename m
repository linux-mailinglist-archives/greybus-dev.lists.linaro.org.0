Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A081F7B04
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Jun 2020 17:37:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 974156192B
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Jun 2020 15:37:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8BDF36652E; Fri, 12 Jun 2020 15:37:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14AB26652F;
	Fri, 12 Jun 2020 15:37:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 533296192B
 for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2020 15:37:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3873B6652E; Fri, 12 Jun 2020 15:37:34 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by lists.linaro.org (Postfix) with ESMTPS id 362E06192B
 for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2020 15:37:33 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x22so4475441pfn.3
 for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2020 08:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yeQePqg3uWAwrie1fUmEupGOkhDXHe9EBr4w1yLk0WI=;
 b=DM5qB6w18XJB1ZkPXxQ4gqnARnlsTqiAL5aYouylm28vAeKGroKHol3DBzqMx+H6IA
 lTTK4TrC+gPjQCKXn2pCfP58C/b689RAJScDXcyJ9Gxf7XLsRfQLQ/PiESofQJOuuOkL
 6ERXa9YBf8Cg0+ATZqE112mVnEroAIoFyTXbK+gYmuu6I6zL42Cj0QwKGc1AJm+W/H4I
 8H1aUp2YvWHnqcqScqO6UUxXTjYNun16PohXHO3a3xRDS0rYbu7IFw1ZL4cvTPxoEFYo
 Vm3eUCDmXE5VkRKfF5wjkWBXL4Kyd803mbiRxzxzp3Sb21O4M3qNHG66gtJJVF2i8vo9
 9zbg==
X-Gm-Message-State: AOAM530DEkUfX3uTgODwDqaD/tsgPiD1ZmX92B7uw4Z308pZQ5ppFGoN
 8A8S3NZWmTDraH3IA5XZYkg=
X-Google-Smtp-Source: ABdhPJx3K+XSpLrzivT/rI9+MH+R35M6XFdycVvYMHz1m+33OwfD46jZYe6e76uYodfTAJXUy5H9gQ==
X-Received: by 2002:a63:9347:: with SMTP id w7mr11155653pgm.409.1591976252287; 
 Fri, 12 Jun 2020 08:37:32 -0700 (PDT)
Received: from gmail.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id 140sm6457374pfy.95.2020.06.12.08.37.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 08:37:31 -0700 (PDT)
Date: Fri, 12 Jun 2020 21:07:24 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200612153722.GB26807@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610182322.GC21465@gmail.com>
 <20200611082616.GA4671@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611082616.GA4671@sirena.org.uk>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v2 0/6] Enable Greybus Audio codec driver
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

T24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMDk6MjY6MTZBTSArMDEwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBXZWQsIEp1biAxMCwgMjAyMCBhdCAxMTo1MzoyNFBNICswNTMwLCBWYWliaGF2IEFn
YXJ3YWwgd3JvdGU6Cj4gCj4gPiBXaXRoIHBhdGNoIzYgaW4gdGhpcyBzZXJpZXMsIEknbSBwcm9w
b3Npbmcgc29tZSBvZiB0aGUgKGR1bW15KSBoZWxwZXIgCj4gPiBBUElzIHJlcXVpcmVkIHRvIGxp
bmsgREFQTSBEQUkgd2lkZ2V0cyBmb3IgdGhlIEdCIEF1ZGlvIG1vZHVsZXMgCj4gPiBhZGRlZC9y
ZW1vdmVkIGR5bmFtaWNhbGx5Lgo+IAo+ID4gRXZlbnR1YWxseSwgSSB3b3VsZCBsaWtlIHRvIHBy
b3Bvc2UgcmVsZXZhbnQgY2hhbmdlcyBpbiBzbmQtc29jIEFQSXMgdG8gCj4gPiBlbmFibGUgZHlu
YW1pYyBsaW5raW5nIG9mIERBSSB3aWRnZXRzIGZvciB0aGUgbW9kdWxlcyBhZGRlZCBhbmQgCj4g
PiByZW1vdmUvZnJlZSBjb21wb25lbnQgY29udHJvbHMgZm9yIHRoZSBtb2R1bGUgcmVtb3ZlZC4K
PiAKPiA+IEknbSBzZWVraW5nIHlvdXIgb3BpbmlvbiBvbiB0aGUgcHJvcG9zZWQgY2hhbmdlcy4g
QW5kIGFzIHBlciB0aGUgCj4gPiByZWNvbW1lbmRhdGlvbiBJJ20gc2hhcmluZyB0aGUgY2hhbmdl
cyB3aXRoIEFTb0MgbWFpbGluZyBsaXN0IGFzIHdlbGwuCj4gCj4gVGhlc2UgYXJlIHByb3Bvc2Vk
IGluY3JlbWVudGFsIGNoYW5nZXMgdG8gYW4gb3V0IG9mIHRyZWUgZHJpdmVyIHRoYXQgaGFzCj4g
bmV2ZXIgYmVlbiBzdWJtaXR0ZWQuICBJIGRvbid0IGtub3cgd2hhdCB0aGUgY3VycmVudCBjb2Rl
IGxvb2tzIGxpa2UsCj4gd2hhdCBpdCdzIHN1cHBvc2VkIHRvIGJlIGRvaW5nIG9yIGFueXRoaW5n
IGxpa2UgdGhhdCBzbyBJJ3ZlIG5vIGlkZWEKPiB3aGF0J3MgZ29pbmcgb24gb3Igd2h5Lgo+IAo+
ID4gS2luZGx5IHN1Z2dlc3QgbWUgdGhlIHByZWZlcnJlZCB3YXkgdG8gZm9sbG93IG9uIHRoaXMg
dGhyZWFkLiAKPiAKPiBUaGlzIGlzIGVmZmVjdGl2ZWx5IG91dCBvZiB0cmVlIGNvZGUsIHVudGls
IHNvbWVvbmUgc3VibWl0cyBpdCBwcm9wZXJseQo+IEknbSBub3Qgc3VyZSBpdCdzIHVzZWZ1bCB0
byBzdWJtaXQgaW5jcmVtZW50YWwgcGF0Y2hlcyB1cHN0cmVhbS4KClRoYW5rcyBmb3IgdGhlIHN1
Z2dlc3Rpb24gTWFyay4gSSdsbCBjcmVhdGUgYSBzZXBhcmF0ZSBwYXRjaHNldCBhbGlnbmVkIAp0
byB0aGUgQVNvQyB0cmVlIGluIG5leHQgfjIgd2Vla3MgYW5kIHNoYXJlIHRoZW0gc2VwYXJhdGVs
eS4KCkhpIEdyZWcsCgpEbyB5b3UgdGhpbmsgdGhlIGN1cnJlbnQgcGF0Y2hzZXQgY2FuIGJlIGNv
bnNpZGVyZWQgZm9yIHRoZSBwdXJwb3NlIG9mIApyZXNvbHZpbmcgY29tcG9uZW50aXphdGlvbiBp
c3N1ZSByYWlzZWQgYnkgQWxleGFuZHJlPwoKLS0KUmVnYXJkcywKVmFpYmhhdgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=

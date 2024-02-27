Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A1F869A49
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Feb 2024 16:25:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 485EF40CEF
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Feb 2024 15:25:20 +0000 (UTC)
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	by lists.linaro.org (Postfix) with ESMTPS id 515CB3EB98
	for <greybus-dev@lists.linaro.org>; Tue, 27 Feb 2024 15:25:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=animalcreek.com header.s=fm2 header.b="g /OAwn8";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=auIvCa4B;
	spf=pass (lists.linaro.org: domain of mgreer@animalcreek.com designates 103.168.172.158 as permitted sender) smtp.mailfrom=mgreer@animalcreek.com;
	dmarc=none
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id EC67311400AB;
	Tue, 27 Feb 2024 10:25:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 27 Feb 2024 10:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1709047513; x=
	1709133913; bh=vk7zMywue6u8Ewys2yjE1YQdG3Ysi/Bjgx+fg8Jugd8=; b=g
	/OAwn8Nnd5m2DeHCOg5TZK3ISBP+1I13sk4tur6CbpG6Zfo4jrTWcFTD287kNrM9
	/ImIlcYeneF5cktE0bVwndusGl0UKNDbQkHL8D3580oIe5JkQ5er/jJyODDWNU4E
	TJVzhKtyfxvhik86j2RGgD/RpPr661K4FfyXnFPs/jxrgLiRAv0deAGBAOPyz/TS
	5EwPR/Sji/TG8uaQ8qzS2GB0NXLKPgh6mhK22n73uRUFy6HS9L8n5tBxoYvd+SIz
	UPbj2DQMMn2LkK0vqJMSd0M5lkjb+LRfQlClFOdLJhQRurMPEkugnLuizbXXRbv6
	UcyA5htnWMvFRUxmUEGUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709047513; x=1709133913; bh=vk7zMywue6u8Ewys2yjE1YQdG3Ys
	i/Bjgx+fg8Jugd8=; b=auIvCa4Bew62NXoHyKzQ9QD86zcWg4W/ntUvHxa3VrLP
	swYPAQgJDNxhX57rC6LdlOFs2V/dfZDgruU526I144YNsOm3N/TlVNFKS/OYYuem
	De+QROOwIaN+UdDeyQXdAUQwM+A0ddkCs3c0lXBV5xRglUyJcAWl0uryg+03EcTS
	SofGAOpjCVpQiT/SP+V7TxKLJHJFo0GWxIgq6udPpsW8ezVOY/Tb+vZsB3enf/TY
	DPZCJu3eTjP+7HX0N+27ZL0mrFoJDRPT7EY6P6D+bXXrB+TDGopfp89LDDQDyQnN
	m+mj0bzwf3iwaUOUusFyqzw8BA+al/TSKQUi7bLPAQ==
X-ME-Sender: <xms:2f7dZUJAXZnYXvIvAF2-0j4e77H-W92fq7tchj4kgDUkR6qJmJFfkw>
    <xme:2f7dZULEPdV4H-hUqMxH8HXOwzwmxLOl_Uh7YQLP4JL8cgSUXCxPbcRP0jIoAyMhE
    aR0xqCNRDdKofdxzg>
X-ME-Received: <xmr:2f7dZUs02GkQ4DkmUxSU6tAkvA6nns-mWYm_v2FmV61osXXOTXaX0T4WzuNGQtWxJfQ8X8gZkLN6iQkgdhNLUNdQTvG0GdZzJ95q3O8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeugfejtefgteegieffjeejtedtveefvefffeegkefhtdehtdfgfeev
    keegvedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:2f7dZRYSEdTKiw6R15rDIrPVYYebeNpstNURMPqaeJIp835TaHPDzA>
    <xmx:2f7dZbY7EJ45ERcoMfNheIhetD0dCO0groHy2l0absyxjoqR0MAqAw>
    <xmx:2f7dZdCMPUPcPY8MYFGAijD5ve1ergrRr_bjMufMdeqEoPOQ_2ZfYQ>
    <xmx:2f7dZXrm061gXS4OrDsnJsGaqWnOESVkr1RdXkH9YjzHhh50JUKT-A>
Feedback-ID: i9cc843c7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Feb 2024 10:25:12 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 9CF18521078; Tue, 27 Feb 2024 08:25:11 -0700 (MST)
Date: Tue, 27 Feb 2024 08:25:11 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <Zd3+1xJnl7d22xIb@animalcreek.com>
References: <20240217154758.7965-1-erick.archer@gmx.com>
 <02cf87a3-4e92-4f6d-98f6-dfc0e198d462@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02cf87a3-4e92-4f6d-98f6-dfc0e198d462@ieee.org>
Organization: Animal Creek Technologies, Inc.
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 515CB3EB98
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[animalcreek.com:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:103.168.172.128/27];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:209242, ipnet:103.168.172.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[animalcreek.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmx.com,gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,chromium.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[animalcreek.com:+,messagingengine.com:+]
Message-ID-Hash: ARBVPT5GJIDNSNZ3AIFKWKQ5DPE3STGF
X-Message-ID-Hash: ARBVPT5GJIDNSNZ3AIFKWKQ5DPE3STGF
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Erick Archer <erick.archer@gmx.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: apbridgea: Remove flexible array from struct audio_apbridgea_hdr
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ARBVPT5GJIDNSNZ3AIFKWKQ5DPE3STGF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 17, 2024 at 03:18:59PM -0600, Alex Elder wrote:
> On 2/17/24 9:47 AM, Erick Archer wrote:
> > When a struct containing a flexible array is included in another struct,
> > and there is a member after the struct-with-flex-array, there is a
> > possibility of memory overlap. These cases must be audited [1]. See:
> > 
> > struct inner {
> > 	...
> > 	int flex[];
> > };
> > 
> > struct outer {
> > 	...
> > 	struct inner header;
> > 	int overlap;
> > 	...
> > };
> > 
> > This is the scenario for the "struct audio_apbridgea_hdr" structure
> > that is included in the following "struct audio_apbridgea_*_request"
> > structures:
> 
> Yeah this was not a very good way to define these header
> structures, but I'm glad to hear the flexible array at the
> end was never used.  I don't know why it was there; maybe
> it's an artifact from some other information that got removed.
> 
> If the code compiles with your change, it ought to be fine.
> (It compiles for me.)
> 
> It would be good for Vaibhav or Mark to comment though, maybe
> they can provide some context.

Sorry for the delay guys.

The way this was done comes from associated firmware that ran on the
APBridge. This goes back a while but I think the packet headers may have
been in flux at the time and this was a convenient way to change all of
the packets if & when it changed.  Anyway, it doesn't seem so convenient
now. :)

So, yeah, getting rid of it sounds like a good thing to do to me.

> I'd like to hear from these others, but otherwise this change
> looks good to me.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>


> > diff --git a/drivers/staging/greybus/audio_apbridgea.h b/drivers/staging/greybus/audio_apbridgea.h
> > index efec0f815efd..ab707d310129 100644
> > --- a/drivers/staging/greybus/audio_apbridgea.h
> > +++ b/drivers/staging/greybus/audio_apbridgea.h
> > @@ -65,7 +65,6 @@
> >   struct audio_apbridgea_hdr {
> >   	__u8	type;
> >   	__le16	i2s_port;
> > -	__u8	data[];
> >   } __packed;
> > 
> >   struct audio_apbridgea_set_config_request {
> > --
> > 2.25.1

Acked-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

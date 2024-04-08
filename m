Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1989CBB6
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 20:30:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2F28A43FB4
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 18:30:35 +0000 (UTC)
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	by lists.linaro.org (Postfix) with ESMTPS id 6FB25400D7
	for <greybus-dev@lists.linaro.org>; Mon,  8 Apr 2024 18:30:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=arndb.de header.s=fm2 header.b=mfK9enkX;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=uP7v9bHu;
	dmarc=pass (policy=none) header.from=arndb.de;
	spf=pass (lists.linaro.org: domain of arnd@arndb.de designates 64.147.123.158 as permitted sender) smtp.mailfrom=arnd@arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id B2A7618000FF;
	Mon,  8 Apr 2024 14:30:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 08 Apr 2024 14:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712601026; x=1712687426; bh=fXxNckLzjc
	Pn37VK3Vmo5LPJa5sdva5WveaKb5nJYi4=; b=mfK9enkX8ouYxGvYuixu29BvEM
	CzmKtHLrOt/V4LeNwWdzfOB9Rmfc7Wqk93Z8/2tSMELejs5r0snTS/X75oQ0Ud2H
	/dYLUc/DS6FOfusFu8w4OF9CkK2Zzq2PrjIPWtolpy6A0BTeUaxVU30O44K4Y/H/
	whQSjk9pl4hu4jFPwB0Dm5nMVAlYsIEa06FOWY8+BsrVTW5iASRmriT/kYdMb77y
	UnY6wvn+14z115rJpwsF4fnnNtP3doqutRa8zsF7rCBxHl6fLIHjAXse2N6/tbH5
	PHlpq9LygPKmnN2+OSXIANln175e/SKwjV3+Dai4yrzVGf8bib9J1N224WCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712601026; x=1712687426; bh=fXxNckLzjcPn37VK3Vmo5LPJa5sd
	va5WveaKb5nJYi4=; b=uP7v9bHuYcP2iHfTVcQJB5gsUqdkT+IlQ3lgMGme0qx2
	in1ueb+a2lMy0zo5rW8mD4JYrNLPpg1R1xI284Tk/48DSxxvgyg52c8BGOt4sal4
	NeyUZeY5X+EBf8VoltXknMmwt0eiues1qBmAeTZnKe0hKXimkZdMZpEQNLXdAUvX
	hZMMXLFlVkI6UNeSRk2QG+PbdASQsGhzyyJtZ/R5kQtYI4GvNI2uMyeDjtkjiaqw
	IOqkNV6gTM9Q/7zLdZGLohbnK4V3sZ72LFZ25jzNVMk/GEGMk8cbwqT1ETJeMeH/
	akuyA98qvVoNoWkbw5Pv5eHS+rp91nmOvKeIzUHF4w==
X-ME-Sender: <xms:wTcUZu-k6fUSFYc5bGHuQmD0i3256fZX9KPtaXXhGbCtwkkZZNe9AQ>
    <xme:wTcUZusP9DTAWST8MwFZJgNC8owUlHWL_07d788p9SC_fmHYls8W-4ngpFZewJ6aW
    SEEmkPgyurz-pzLXBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeejvddvvdduleduheejiedtheehiedvjefgleelffeigfevhffhueduhfeg
    feefheenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:wjcUZkBBPED_4TdOGA4Xc_0MpiGJwcebpVvddp6bHW7xswGBF0NUuA>
    <xmx:wjcUZme0KmgXY3DkOn1xjetkuWVwNnIbvFkTWRXOBG6mF1EWJhQBQQ>
    <xmx:wjcUZjMee5XpAU6bSgVIwPJ3yhyOSdcbeJp1Q3yLEQCy5nomRtdF2Q>
    <xmx:wjcUZglKeNQ4KZgVXZhfRNS8q3la1wjdLq-Nb_4CqkTHcIcEbsixUQ>
    <xmx:wjcUZuq8AUQF22q65uxq1oxTtRub2cbJ1BXaS2-GLDtqqTFn87G2_HXh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D3982B60089; Mon,  8 Apr 2024 14:30:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-368-gc733b1d8df-fm-20240402.001-gc733b1d8
MIME-Version: 1.0
Message-Id: <72780460-f0cf-4ad1-bf88-f49cb37f0de8@app.fastmail.com>
In-Reply-To: 
 <uejqjxh3ntjdyziy3avisav7ghhb3s66iccfwchjkm534zy3ja@3kxet4bu2ck3>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
 <uejqjxh3ntjdyziy3avisav7ghhb3s66iccfwchjkm534zy3ja@3kxet4bu2ck3>
Date: Mon, 08 Apr 2024 20:30:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Justin Stitt" <justinstitt@google.com>, "Arnd Bergmann" <arnd@kernel.org>
X-Rspamd-Queue-Id: 6FB25400D7
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.67 / 15.00];
	BAYES_HAM(-2.68)[98.61%];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:64.147.123.128/27];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:29838, ipnet:64.147.123.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[arndb.de:dkim,wfhigh7-smtp.messagingengine.com:helo,wfhigh7-smtp.messagingengine.com:rdns,messagingengine.com:dkim];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 7IFMHRC675GJGLTIYAJL75CHGKI7WACK
X-Message-ID-Hash: 7IFMHRC675GJGLTIYAJL75CHGKI7WACK
X-MailFrom: arnd@arndb.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7IFMHRC675GJGLTIYAJL75CHGKI7WACK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 29, 2024, at 00:28, Justin Stitt wrote:
> On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
>>
>>
> Arnd, I see 4 instances of strncpy() in this file. Could you clean them
> all up at once which would help GREATLY towards:
> https://github.com/KSPP/linux/issues/90

Right, I see they all operate on the same string, so it makes
sense to keep these changes together. As Dan suggested, I'm using
the padding variant for all of these here, even though I'm not
entirely sure if this is required.

     Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

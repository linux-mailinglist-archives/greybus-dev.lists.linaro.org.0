Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4034E9BEC
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Mar 2022 18:08:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C0583EEC0
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Mar 2022 16:08:51 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	by lists.linaro.org (Postfix) with ESMTPS id AA4893EBBA
	for <greybus-dev@lists.linaro.org>; Mon, 28 Mar 2022 16:08:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 1A8463201DA2;
	Mon, 28 Mar 2022 12:08:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 28 Mar 2022 12:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=RK/wz/U+TabQb++KAzGvfQskuMllPD
	dsm08D4cpJkec=; b=NVcWj4wjAMrHacgiBm0vLytCFKNuNB3EDWcOA9dEJnpVJX
	XUkbpoHf993ZhGBi/hPPtyuwS2Xh7wt28+EgW9ak1iZE60RFl50CPO4LNmuE5aw0
	eIHWweithGeR6iAVZ+Bb7Z4WkPIZRj1LqCkM/VNjtL9/Ew4xIY/1+gkYfkWACO8G
	w5w1sdzav9MhNkPT5dyCijrkC2DgThazAy6385aJfaFWnrJT6Eyrrq4oDFyACRyA
	YPardJDVkFMmIhQpzfSWmrJnnHHUc7r1CRiVBrTmJsr9julV/6fIdYCA4LKdMt5C
	ywH/yE+BVJrxMjb9a9TdpHJL8B99pTefwRz2nqCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RK/wz/U+TabQb++KA
	zGvfQskuMllPDdsm08D4cpJkec=; b=JPRaQHr1SDfv3tKuhbsVliljiAw+86tp/
	WXOZDWvDJoxGFxxFKOq3cIZVK/3eA2nVDrUM8gGJinU4m4vlOfvlghK1/oFPCLE4
	j3rkeZvZc2DowwnnnOlkFo8ngQS+u4N14KfeN4ouAyHWVZ6KCF3xpQQMdLIFNypV
	d/pqExLEerd+mOGVG27cNgIryKI9ADOHZAOELBSQNy3DH8JvV7qTraArCae8AzbA
	mNPhxd8kZ/Rfs8uadtnAaGDNXd+7HZd6YxpzysTjNQCix2Tg4WLrwcpLKGNCb61l
	ld4JLJhy+3YRxcGRP9v+uoJe0MpwijIIFd+r3gHVrRF8WGraSNYyA==
X-ME-Sender: <xms:jN1BYmY4suobs2sUUBp0M5Dq9MHCrta9W-J_f7bQD82u5w1Jz3Y87A>
    <xme:jN1BYpbDi8buphAtwO7Vk6OMOBb1_n8uzvtCk1nF_2ah8j1ShIERxN_hxvKykSUTJ
    pOxsE1-6HxA7aBhRw>
X-ME-Received: <xmr:jN1BYg9j43Q7HgNz5GplDQ9hgUFfkBQTvtXxnXt60mfdLqPfxZs-gFKQ8eDwEYT4O_SXWdW9TFKmmHjliulukfBbOWOvpwN8MpgHKjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeiuefguddtfeeitddvffetudefvdejhefgveevfedugfejffegieet
    teejudffhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:jd1BYooTiKhX42yKuBXXhbWazOdABTRHbXVrA5965ALSgusYWS4quw>
    <xmx:jd1BYhoS-u6Nbhuu8bH_p2lPg79eH9jtaZgl3HE9DjlJvUz85vb6lA>
    <xmx:jd1BYmStmylj_P1bmoUxTcjIhhijhNBj-VNLAzyd_1f0bAebv06tgQ>
    <xmx:jt1BYs0qUZI5sb1PD54R8hGePO3Tq_5MzvsVBoKAYRb5pbroRj8Vyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 12:08:44 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id B7F8313601FE; Mon, 28 Mar 2022 09:08:43 -0700 (MST)
Date: Mon, 28 Mar 2022 09:08:43 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20220328160843.GA262674@animalcreek.com>
References: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
 <20220328141944.GT3293@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328141944.GT3293@kadam>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: U2F3G26VIXFSXGEVVUYFYR6FQU3IOHJ2
X-Message-ID-Hash: U2F3G26VIXFSXGEVVUYFYR6FQU3IOHJ2
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Xiaomeng Tong <xiam0nd.tong@gmail.com>, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio_codec: fix three missing initializers for data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U2F3G26VIXFSXGEVVUYFYR6FQU3IOHJ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 28, 2022 at 05:19:45PM +0300, Dan Carpenter wrote:
> On Sun, Mar 27, 2022 at 02:01:20PM +0800, Xiaomeng Tong wrote:
> > These three bugs are here:
> > 	struct gbaudio_data_connection *data;
> > 
> > If the list '&codec->module_list' is empty then the 'data' will
> > keep unchanged.
> 
> All three of these functions check for if the codec->module_list is
> empty at the start of the function so these are not real bugs.

Umm, yep, oops.  Thanks Dan.

Mark
--
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

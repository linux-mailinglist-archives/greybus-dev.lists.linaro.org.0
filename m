Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A26FCA9
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 17:22:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 04C73608CE
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 15:22:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EA64060F31; Tue, 30 Apr 2019 15:22:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B390E60EF5;
	Tue, 30 Apr 2019 15:21:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 685FF608AF
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 15:21:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4D17F60832; Tue, 30 Apr 2019 15:21:51 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.linaro.org (Postfix) with ESMTPS id 3B88360832
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 15:21:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 15A6F15AFE;
 Tue, 30 Apr 2019 11:21:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 30 Apr 2019 11:21:50 -0400
X-ME-Sender: <xms:DWjIXGhtDeyoNcCqe_G3cwAqE0el17I5zIgI7brOT8iEDAgiC5RcUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieehgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecuogfhohhrsghiugguvghnjfgurhculdehtddtmdenuc
 fjughrpeffhffvuffkgggtughofgesthdtredttdernecuhfhrohhmpeforghrkhcuifhr
 vggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecukfhppeeike
 drvddrkeejrdelheenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhi
 mhgrlhgtrhgvvghkrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:DWjIXCvVhao1aktXQfSrN1XHQgOQRoq-a08YPpdXlrzJ8O5S1BExwA>
 <xmx:DWjIXIy-bEKQXm3FXz-wU9LDBgn0B67zV19Dz4tF1IknXEW6CqrlwQ>
 <xmx:DWjIXAMxudqp2nOkWuxACH-IIg6BKqbxzBnPQITAWDuGmqpz0UD7Ug>
 <xmx:DmjIXOJQg9p7CgZyrjr9xT2hN45O4gEaQzX7R3J5RdKUiK_ZlPoWIw>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id DEBAE103D0;
 Tue, 30 Apr 2019 11:21:48 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 61CDCA21364; Tue, 30 Apr 2019 08:21:48 -0700 (MST)
Date: Tue, 30 Apr 2019 08:21:48 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: greybus-dev@lists.linaro.org
Message-ID: <20190430152148.GB1854@animalcreek.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] Anyone else having delays with this list?
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

SGkgZXZlcnlvbmUuCgpJcyBhbnlvbmUgZWxzZSBleHBlcmllbmNpbmcgZGVsYXlzIHJlY2Vpdmlu
ZyBlbWFpbCBmcm9tIHRoaXMgbGlzdD8KCkkganVzdCByZWNlaXZlZCBhIGJ1bmNoIHRvZGF5IChB
cHJpbCAzMCkgd2l0aCBzb21lIGVtYWlscyBkYXRpbmcgYmFjayBhcwpmYXIgYXMgSmFuIDE1LgoK
VGhhbmtzLAoKTWFyawotLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
